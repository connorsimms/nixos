vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { current_line = true},
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = { border = 'rounded' },
})

-- Every server here needs its binary installed by a module in
-- modules/user/lsp/, otherwise it fails to attach and the LspAttach keymaps
-- below are never set for that filetype.
vim.lsp.enable({ 'clangd', 'rust_analyzer', 'lua_ls', 'nixd', 'basedpyright', 'ruff' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})

-- Format on save.
--
-- Deliberately not gated on client capabilities at LspAttach: servers such as
-- ruff advertise textDocument/formatting *dynamically*, via
-- client/registerCapability, which arrives after LspAttach fires. Checking
-- there is a race that usually reports formatting=false for every client and
-- silently disables formatting altogether. Capability is checked at save time
-- instead, when it is actually known.
--
-- A client implementing willSaveWaitUntil is excluded because neovim already
-- applies the edits it returns as part of the write.
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(ev)
    local formatters = vim.tbl_filter(
      function(client) return not client:supports_method('textDocument/willSaveWaitUntil') end,
      vim.lsp.get_clients({ bufnr = ev.buf, method = 'textDocument/formatting' })
    )
    if #formatters == 0 then
      return
    end
    vim.lsp.buf.format({
      bufnr = ev.buf,
      timeout_ms = 2000,
      filter = function(client) return not client:supports_method('textDocument/willSaveWaitUntil') end,
    })
  end,
})
