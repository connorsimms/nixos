vim.diagnostic.config({
    virtual_text = false,
    virtual_lines = { current_line = true},
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    float = { border = 'rounded' },
})

vim.lsp.enable({ 'clangd', 'rust_analyzer', 'lua_ls', 'nixd' })

-- format on save
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
    if client:supports_method('textDocument/willSaveWaitUntil')
      or not client:supports_method('textDocument/formatting') then
      return
    end
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = ev.buf,
      callback = function()
        vim.lsp.buf.format({ bufnr = ev.buf, id = client.id, timeout_ms = 1000 })
      end,
    })
  end,
})
