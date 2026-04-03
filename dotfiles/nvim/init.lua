-- Load .vimrc file
local vimrc_path = vim.fn.expand("~/.config/vim/vimrc")

if vim.fn.filereadable(vimrc_path) == 1 then
    vim.cmd('source ' .. vimrc_path)
else
    print("Warning: Vim config not found at " .. vimrc_path)
end

vim.opt.termguicolors = true
vim.g.have_nerd_font = true
vim.opt.inccommand = 'nosplit'
vim.opt.cursorline = true

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

require("config.lazy")
