return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "cpp", "diff", "json",
          "lua", "python", "query", "terraform", "typescript",
          "toml", "vim", "vimdoc", "yaml"},
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {
      max_lines = 3,
    },
    config = true
  }
}
