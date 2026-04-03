return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'main',
  lazy = false,
  -- build = ":TSUpdate",
  -- config = function()
  --   local configs = require("nvim-treesitter.configs")

  --   configs.setup({
  --     ensure_installed = { "c", "cpp", "rust", "python", "lua", "vim" },
  --     highlight = { 
  --       enable = true, 
  --       additional_vim_regex_highlighting = false, 
  --     },
  --     indent = { enable = true },
  --     autotage = { enable = true },
  --     auto_install = false;
  --   })
  -- end
}
