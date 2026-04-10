vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_visual = 'grey background'
vim.g.gruvbox_material_cursor = 'green'
vim.g.gruvbox_material_disable_italic_comment = 1
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_statusline_style = 'mix'
vim.g.gruvbox_material_lightline_disable_bold = 1
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_enable_italic = true
vim.cmd.colorscheme('gruvbox-material')

-- require("transparent").setup({
--   groups = {
--     'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
--     'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
--     'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
--     'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
--     'EndOfBuffer',
--   },
--   enable = true,
--   extra_groups = {},
--   exclude_groups = {},
--   on_clear = function() end,
-- })

require("lualine").setup({
  options = { theme = 'gruvbox-material' }
})
