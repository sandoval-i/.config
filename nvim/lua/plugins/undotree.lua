return {
  "mbbill/undotree",
  event = "VeryLazy",
  init = function()
    vim.keymap.set("n", "<leader>utt", vim.cmd.UndotreeToggle, { desc = "[u]ndo [t]ree [t]oggle" })
  end
}
