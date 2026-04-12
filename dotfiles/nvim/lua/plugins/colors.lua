vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_foreground = 'material'
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
