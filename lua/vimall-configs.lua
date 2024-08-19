-- Cursor
-- TODO     Need to  move this to cursor-configs.lu
vim.cmd("set guicursor=a:hor20-blinkwait0-blinkon500-blinkoff500")

-- Tabs
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Column, Numbering
vim.cmd("set colorcolumn=80")
vim.cmd("set number")

-- <leader>
vim.g.mapleader = " "

-- Remap Window Switches
-- Map Ctrl + h to move to the left window
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {
	desc = "move to left",
	noremap = true,
	silent = true,
})
-- Map Ctrl + l to move to the right window
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {
	desc = "move to right",
	noremap = true,
	silent = true,
})
-- Map Ctrl + j to move to the window below
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {
	desc = "move to below",
	noremap = true,
	silent = true,
})
-- Map Ctrl + k to move to the window above
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {
	desc = "move to above",
	noremap = true,
	silent = true,
})
