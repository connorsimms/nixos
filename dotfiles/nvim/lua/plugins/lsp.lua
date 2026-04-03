return {
  "neovim/nvim-lspconfig",
  lazy = false,
  config = function()
    vim.lsp.config('nil', {
      settings = {
        ['nil'] = {
          formatting = { command = { "nixpkgs-fmt" } },
        },
      },
    })

    vim.lsp.config('lua_ls', {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    vim.lsp.enable('nil')
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('rust_analyzer')
    vim.lsp.enable('pyright')
    vim.lsp.enable('clangd')

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)           -- goto definition
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                 -- info

        -- Advanced Productivity
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)           -- Find all usages
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)       -- smart rename
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)         -- Jump to previous error
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)         -- Jump to next error
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)  -- Quick fixes
      end,
    })
  end,
}
