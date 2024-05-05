return {
  "tpope/vim-fugitive",
  event = "VeryLazy",
  init = function()
    local keymap = vim.keymap;

    keymap.set("n", "<leader>git", vim.cmd.Git, { desc = "[g][i][t]" })
    keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "[g]it [b]lame" })
    keymap.set("n", "<leader>gf", ":Git fetch -p origin<CR>", { desc = "[g]it [f]etch -p origin" })
    keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "[g]it [l]og" })
    keymap.set("n", "<leader>gm", ":Git merge ", { desc = "[g]it [m]erge" })
  end
}
