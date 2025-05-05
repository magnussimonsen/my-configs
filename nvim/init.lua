-- Set up basic options
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true 
vim.opt.tabstop = 2 -- Set tab width to 4 spaces
vim.opt.shiftwidth = 2 -- Set shift width to 4 spaces
vim.opt.expandtab = true -- Use spaces instead of tabs

-- lazy.nvim is a modern plugin manager for Neovim.
require("config.lazy")

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {
    noremap = true
  })



