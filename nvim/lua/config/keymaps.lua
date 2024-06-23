local keymap = vim.keymap
vim.g.mapleader = " "

-- Competitive programming related
keymap.set("n", "<leader>yy", ":%yank +<CR>", { desc = "Yank content of file into quoteplus register"})
keymap.set("n", "<leader>yp", ":let @+ = expand('%')<CR>", { desc = "Yank file path into quoteplus register"})
-- keymap.set("n", "<leader>r", ":make<CR>:!./template < in", { desc = "Compile template.cpp and run executable"})

keymap.set("n", "-", vim.cmd.Ex)
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "N", "Nzz")

keymap.set("n", "<leader>co", ":copen<CR>", { desc = "Open quickfix window"})
keymap.set("n", "<leader>cc", ":cclose<CR>", { desc = "Close quickfix window"})
keymap.set("n", "<leader>cn", ":cnext<CR>", { desc = "Next error"})
keymap.set("n", "<leader>cp", ":cprev<CR>", { desc = "Previous error"})
