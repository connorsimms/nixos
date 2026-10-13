vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { current_line = true},
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = { border = 'rounded' },
})

vim.lsp.enable({ 'clangd', 'rust_analyzer', 'lua_ls', 'nixd', 'basedpyright', 'ruff' })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  end,
})

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
