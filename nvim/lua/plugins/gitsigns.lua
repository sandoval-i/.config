return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  config = true,
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require("gitsigns")
      vim.keymap.set("n", "[g", function() gitsigns.nav_hunk("prev") end, { buffer = bufnr, desc = "prev hunk" })
      vim.keymap.set("n", "]g", function() gitsigns.nav_hunk("next") end, { buffer = bufnr, desc = "next hunk" })
    end
  },
}
