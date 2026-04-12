-- Load .vimrc file
local vimrc_path = vim.fn.expand("~/.config/vim/vimrc")

if vim.fn.filereadable(vimrc_path) == 1 then
    vim.cmd('source ' .. vimrc_path)
else
    print("Warning: Vim config not found at " .. vimrc_path)
end

require("plugins")
