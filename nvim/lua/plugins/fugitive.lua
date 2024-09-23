return {
  "tpope/vim-fugitive",
  keys = {
    { "<leader>git", vim.cmd.Git, { desc = "[g][i][t]" } },
    { "<leader>gb", ":Git blame<CR>", { desc = "[g]it [b]lame" } },
    { "<leader>gf", ":Git fetch -p origin<CR>", { desc = "[g]it [f]etch -p origin" } },
    { "<leader>gl", ":Git log<CR>", { desc = "[g]it [l]og" } },
    { "<leader>gm", ":Git merge ", { desc = "[g]it [m]erge" } },
  },
}
