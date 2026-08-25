vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('n', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('v', '<leader>y', '"+y', { desc = 'Yank to system clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = 'Yank to system clipboard' })

vim.keymap.set('n', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set('v', '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set('n', '<leader>P', '"+P', { desc = 'Paste from system clipboard' })

vim.keymap.set('n', '<leader>\\', ':vsplit<CR>', { desc = 'Vertically split buffer' })
vim.keymap.set('n', '<leader>-', ':split<CR>', { desc = 'Horizontally split buffer' })

vim.keymap.set('n', '<C-c>', ':nohlsearch<CR>', { desc = 'Clear search highlights' })

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })

vim.keymap.set("v", "<", "<gv", { desc = "Indent left (reselect)" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right (reselect)" })

vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Exit to file explorer" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })

local function tmux_move(direction)
  local old_win = vim.api.nvim_get_current_win()
  vim.cmd('wincmd ' .. direction)
  if old_win == vim.api.nvim_get_current_win() then
    if os.getenv("TMUX") then
      local tmux_dirs = { h = 'L', j = 'D', k = 'U', l = 'R' }
      vim.fn.system('tmux select-pane -' .. tmux_dirs[direction])
    end
  end
end

local opts = { silent = true }
vim.keymap.set('n', '<C-h>', function() tmux_move('h') end, opts)
vim.keymap.set('n', '<C-j>', function() tmux_move('j') end, opts)
vim.keymap.set('n', '<C-k>', function() tmux_move('k') end, opts)
vim.keymap.set('n', '<C-l>', function() tmux_move('l') end, opts)
