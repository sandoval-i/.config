return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  main = "ibl",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    scope = {
      show_start = false,
      show_end = false,
    },
  },
}
