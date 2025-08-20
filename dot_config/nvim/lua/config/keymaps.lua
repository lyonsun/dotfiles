-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>t", ":terminal<CR>")
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>gj", "<cmd>GoTagAdd json<cr>")

vim.keymap.set("n", "<leader>hp", "<cmd>Gitsigns preview_hunk<cr>")
vim.keymap.set("n", "<leader>hd", "<cmd>Gitsigns diffthis<cr>")
vim.keymap.set("n", "<leader>hb", "<cmd>Gitsigns blame_line<cr>")
