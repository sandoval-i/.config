return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      cmp = true,
      mason = true,
      harpoon = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
      indent_blankline = {
        enabled = false,
      }
    }
  }
}
