return {
  "nvim-lualine/lualine.nvim",
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      theme = "tokyonight",
    },
    sections = {
      lualine_z = { "location", "lsp_status" },
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
