local status, telescope = pcall(require, "telescope")
if not status then return end

telescope.setup({
  extensions = { fzf = { fuzzy = true } }
})

pcall(telescope.load_extension, 'fzf')

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope recent files' })
vim.keymap.set('n', '<leader>fc', builtin.grep_string, { desc = 'Telescope string under cursor' })
vim.keymap.set('n', '<leader>fz', builtin.resume, { desc = 'Telescope resume last search' })
vim.keymap.set('n', '<leader>fb', function()
  builtin.buffers(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = 'Telescope buffers (dropdown)' })
