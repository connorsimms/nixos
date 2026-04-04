local configs = require('lspconfig.configs')

-- 1. Define your shared "on_attach" logic
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)           -- Info
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)    -- Go to definition
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)    -- Find usages
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- Rename
  end,
})

-- 2. Use the new 0.12 syntax to enable servers
-- This tells Neovim: "Use the industrial settings from lspconfig for these"
vim.lsp.enable('nil_ls')
vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('pyright')

-- 3. If you need specific settings (like for Lua), do it here
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = { globals = { 'vim' } },
    },
  },
})
