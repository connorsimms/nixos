local configs = require('lspconfig.configs')

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)           -- Info
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)    -- Go to definition
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)    -- Find usages
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Rename
  end,
})

vim.lsp.enable('nil_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')

vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
})
