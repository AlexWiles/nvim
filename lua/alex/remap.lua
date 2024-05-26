vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- When pasting over a visual selection, don't copy the selection
-- vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- move between panes with <C-hjkl>
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- resize panes with A-HJKL
vim.keymap.set("n", "<A-h>", "<C-w><")
vim.keymap.set("n", "<A-j>", "<C-w>-")
vim.keymap.set("n", "<A-k>", "<C-w>+")
vim.keymap.set("n", "<A-l>", "<C-w>>")
