return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      fidget = true, -- required
      gitsigns = false, -- required
      harpoon = true, -- required
      indent_blankline = {
        scope_color = "lavender", -- required
      },
      mason = true, -- required
      which_key = true, -- required
    },
    color_overrides = {
      mocha = {
        base = "#000000",
        mantle = "#000000",
        crust = "#000000",
      },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
