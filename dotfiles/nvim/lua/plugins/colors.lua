vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_foreground = 'material'
vim.cmd.colorscheme('gruvbox-material')

require("lualine").setup({
  options = { theme = 'gruvbox-material' }
})
