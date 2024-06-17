return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {"nvim-treesitter/nvim-treesitter"},
  main = "ibl",
  event = "VeryLazy",
  opts = {
    scope = {
      show_start = false,
      show_end = false
    }
  },
  config = true
}
