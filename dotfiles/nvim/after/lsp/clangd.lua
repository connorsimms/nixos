local found_by_clangd = { '.', 'build' }
local nested = {
    'build/*',
    'out/build/*',
    'cmake-build-*',
    'builddir',
}

local function has_database(dir)
    return vim.uv.fs_stat(vim.fs.joinpath(dir, 'compile_commands.json')) ~= nil
end

-- True when the project already tells clangd where to look.
local function configured_by_project(root)
    if vim.uv.fs_stat(vim.fs.joinpath(root, 'compile_flags.txt')) then
        return true
    end
    local dotclangd = vim.fs.joinpath(root, '.clangd')
    if vim.uv.fs_stat(dotclangd) then
        for line in io.lines(dotclangd) do
            if line:match('^%s*CompilationDatabase:') then
                return true
            end
        end
    end
    return false
end

-- Returns the database directory, and whether clangd needs to be told about it.
local function find_database(root)
    if not root then
        return nil, false
    end
    for _, rel in ipairs(found_by_clangd) do
        local dir = vim.fs.normalize(vim.fs.joinpath(root, rel))
        if has_database(dir) then
            return dir, false
        end
    end
    if configured_by_project(root) then
        return nil, false
    end
    local newest, newest_mtime = nil, -1
    for _, pattern in ipairs(nested) do
        for _, dir in ipairs(vim.fn.glob(vim.fs.joinpath(root, pattern), false, true)) do
            local stat = vim.uv.fs_stat(vim.fs.joinpath(dir, 'compile_commands.json'))
            if stat and stat.mtime.sec > newest_mtime then
                newest, newest_mtime = dir, stat.mtime.sec
            end
        end
    end
    return newest, newest ~= nil
end

-- The compiler of the database's first entry, or nil if it can't be read.
local function database_compiler(dir)
    local file = io.open(vim.fs.joinpath(dir, 'compile_commands.json'))
    if not file then
        return nil
    end
    local ok, entries = pcall(vim.json.decode, file:read('*a'))
    file:close()
    local entry = ok and type(entries) == 'table' and entries[1]
    if type(entry) ~= 'table' then
        return nil
    end
    return entry.arguments and entry.arguments[1] or (entry.command or ''):match('^%S+')
end

-- On darwin, nixpkgs' clangd can't index against Apple's SDK and libc++ (its
-- builtin headers clash with them), while Apple's clangd handles both Apple
-- and nix-wrapped compilers. So use the nix clangd only for databases built
-- by a nix compiler, and Apple's otherwise.
local function clangd_binary(db)
    if vim.fn.has('mac') == 0 then
        return 'clangd'
    end
    local compiler = db and database_compiler(db)
    if compiler and vim.startswith(compiler, '/nix/store/') then
        return 'clangd'
    end
    return '/usr/bin/clangd'
end

return {
    -- Resolved per server start, so after the first `cmake` configure (or
    -- switching presets) run `:lsp restart clangd` to pick up the new database.
    cmd = function(dispatchers, config)
        local db, needs_flag = find_database(config.root_dir)
        local cmd = {
            clangd_binary(db),
            '--background-index',
            '--clang-tidy',
            '--header-insertion=never',
            '--completion-style=detailed',
            -- Let clangd ask these compilers for their system includes. Nix-wrapped
            -- compilers from devshells only report the right paths this way. Kept
            -- narrow because clangd executes whatever driver a repo's database names.
            '--query-driver=/nix/store/**/bin/*,/usr/bin/*,/opt/homebrew/bin/*,/run/current-system/sw/bin/*,/etc/profiles/per-user/*/bin/*',
        }
        if needs_flag then
            table.insert(cmd, '--compile-commands-dir=' .. db)
        end
        return vim.lsp.rpc.start(cmd, dispatchers, { cwd = config.cmd_cwd, env = config.cmd_env })
    end,
}
