-- Set up basic options
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true 
vim.opt.tabstop = 2 -- Set tab width to 4 spaces
vim.opt.shiftwidth = 2 -- Set shift width to 4 spaces
vim.opt.expandtab = true -- Use spaces instead of tabs
-- Clipboard in Ubuntu: sudo apt install xclip 
vim.opt.clipboard = 'unnamedplus'


-- lazy.nvim is a modern plugin manager for Neovim.
require("config.lazy")

-- leader shortcut (space) to open File Explorer Tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {
    noremap = true })

-- leader shortcut (space) to open terminal on the right
vim.keymap.set('n', '<leader>tl', function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("L")  -- move to bottom of screen
	vim.cmd.normal("i")  -- switch to insert mode
	vim.api.nvim_win_set_width(0, 50)
	end, {
    noremap = true })
    
-- leader shortcut (space) to open terminal the bottom
vim.keymap.set('n', '<leader>tb', function()
	vim.cmd.vnew()
	vim.cmd.term()
	vim.cmd.wincmd("J")  -- move to bottom of screen
	vim.cmd.normal("i")  -- switch to insert mode
	vim.api.nvim_win_set_height(0, 5)
	end, {
    noremap = true })
