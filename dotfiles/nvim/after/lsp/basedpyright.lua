return {
  -- Without a venv on PATH (direnv/devshell), basedpyright falls back to the
  -- system python. Prefer the project's uv/venv interpreter when there is one.
  before_init = function(_, config)
    local python = config.root_dir and vim.fs.joinpath(config.root_dir, '.venv', 'bin', 'python')
    if python and vim.uv.fs_stat(python) then
      config.settings.python = vim.tbl_extend('force', config.settings.python or {}, { pythonPath = python })
    end
  end,
  settings = {
    basedpyright = {
      -- ruff organizes imports; two servers offering it conflict.
      disableOrganizeImports = true,
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = 'openFilesOnly',
        typeCheckingMode = 'standard',
      },
    },
  },
}
