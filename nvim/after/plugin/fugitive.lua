local keymap = vim.keymap;
keymap.set("n", "<leader>git", vim.cmd.Git, { desc = "Git-fugitive plugin" })
keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "[g]it [b]lame" })
