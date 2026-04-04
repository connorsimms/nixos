vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'material'

vim.cmd.colorscheme('gruvbox-material')

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

require('lualine').setup({
  options = { theme = 'gruvbox-material' }
})
