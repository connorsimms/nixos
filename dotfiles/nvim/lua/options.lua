vim.opt.number = true           -- line numbering
vim.opt.relativenumber = true   -- relative line numbering
vim.opt.cursorline = true       -- highlight cursor line
vim.opt.wrap = false            -- disable line wrapping
vim.opt.scrolloff = 10          -- number of lines above/below cursor
vim.opt.sidescrolloff = 10      -- number of lines left/right of cursor

vim.opt.tabstop = 4                     -- tab multiple
vim.opt.softtabstop = 4                 -- softtab multiple
vim.opt.shiftwidth = 4                  -- indent width
vim.opt.expandtab = true                -- spaces instead of tabs
vim.opt.smartindent = true              -- smarter auto indents
vim.opt.autoindent = true               -- indent based on current line
vim.opt.backspace = "indent,eol,start"  -- better backspacing

vim.opt.ignorecase = true       -- case insensitive searching
vim.opt.smartcase = true        -- unless uppercase in string
vim.opt.hlsearch = true         -- highlight matches
vim.opt.incsearch = true        -- show matches incrementally
vim.opt.inccommand = "split"    -- show modifications in split

vim.opt.signcolumn = "number"   -- more compact
vim.opt.colorcolumn = "100"     -- show column 100
vim.opt.showmatch = false       -- do not show matching brackets
vim.opt.splitbelow = true       -- horizontal splits go below
vim.opt.splitright = true       -- vertical splits go right
vim.opt.hidden = true           -- allow hidden buffers
vim.opt.errorbells = false      -- no error sounds
vim.opt.mouse = "v"             -- mouse support for view mode

local undodir = vim.fn.expand("~/.local/share/nvim")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false          -- no backup files
vim.opt.writebackup = false     -- no writing to backup files
vim.opt.swapfile = false        -- no swapfiles
vim.opt.undofile = true         -- create undo files
vim.opt.undodir = undodir       -- set the undo directory
vim.opt.updatetime = 300        -- faster completion
vim.opt.autoread = true         -- auto-reload changes if outside of neovim
vim.opt.autowrite = false       -- do not auto-save
