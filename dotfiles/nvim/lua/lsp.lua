vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { current_line = true},
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = { border = 'rounded' },
})

vim.lsp.enable({ 'clangd', 'neocmake', 'rust_analyzer', 'lua_ls', 'nixd', 'basedpyright', 'ruff' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<leader>ih', function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
    end, { buffer = ev.buf, desc = 'Toggle inlay hints' })

    if client.name == 'clangd' then
      vim.keymap.set('n', '<leader>ch', '<cmd>LspClangdSwitchSourceHeader<CR>',
        { buffer = ev.buf, desc = 'Switch source/header' })
    elseif client.name == 'ruff' then
      -- basedpyright's hover is the useful one; ruff's only covers noqa codes.
      client.server_capabilities.hoverProvider = false
    end
  end,
})

-- Format-on-save only runs where a project opts into a formatter, so opening
-- someone else's repo doesn't rewrite every file you save.
local function pyproject_has_ruff(root)
  local file = io.open(vim.fs.joinpath(root, 'pyproject.toml'))
  if not file then
    return false
  end
  local text = file:read('*a')
  file:close()
  return text:find('%[tool%.ruff') ~= nil
end

local format_markers = {
  c = { '.clang-format', '_clang-format' },
  cpp = { '.clang-format', '_clang-format' },
  cuda = { '.clang-format', '_clang-format' },
  cmake = { '.gersemirc' },
  python = function(buf)
    if vim.fs.root(buf, { 'ruff.toml', '.ruff.toml' }) then
      return true
    end
    local root = vim.fs.root(buf, 'pyproject.toml')
    return root ~= nil and pyproject_has_ruff(root)
  end,
}

local function project_wants_format(buf)
  local markers = format_markers[vim.bo[buf].filetype]
  if markers == nil then
    return true
  elseif type(markers) == 'function' then
    return markers(buf)
  end
  return vim.fs.root(buf, markers) ~= nil
end

-- gersemi isn't a language server, so CMake files are piped through it.
local function format_cmake(buf)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  local result = vim.system(
    { 'gersemi', '--stdin-filepath', vim.api.nvim_buf_get_name(buf), '-' },
    { stdin = table.concat(lines, '\n') .. '\n', text = true }
  ):wait(2000)
  if result.code ~= 0 then
    vim.notify('gersemi: ' .. (result.stderr or 'failed'), vim.log.levels.WARN)
    return
  end
  local formatted = vim.split(result.stdout, '\n', { trimempty = false })
  if formatted[#formatted] == '' then
    table.remove(formatted)
  end
  if not vim.deep_equal(lines, formatted) then
    local view = vim.fn.winsaveview()
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, formatted)
    vim.fn.winrestview(view)
  end
end

local function format(buf)
  if vim.bo[buf].filetype == 'cmake' then
    format_cmake(buf)
    return
  end
  local filter = function(client) return not client:supports_method('textDocument/willSaveWaitUntil') end
  if #vim.tbl_filter(filter, vim.lsp.get_clients({ bufnr = buf, method = 'textDocument/formatting' })) == 0 then
    return
  end
  vim.lsp.buf.format({ bufnr = buf, timeout_ms = 2000, filter = filter })
end

vim.keymap.set('n', '<leader>cf', function() format(0) end, { desc = 'Format buffer' })

vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(ev)
    if project_wants_format(ev.buf) then
      format(ev.buf)
    end
  end,
})
