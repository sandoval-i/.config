return {
  "voldikss/vim-floaterm",
  keys = {
    { "<leader>tt", ":FloatermToggle<CR>", desc = "[t]oggle [t]erminal" },
    { "<Esc>", ":close<CR>", ft = "floaterm" },
    { "<Esc>", "<C-\\><C-N>", mode = "t" },
  },
}
