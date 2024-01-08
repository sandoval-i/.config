local keymap = vim.keymap;

keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Git-fugitive plugin" })
