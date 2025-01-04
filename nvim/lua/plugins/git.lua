return {
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    keys = {
      { "<leader>git", vim.cmd.Git, desc = "[g][i][t]" },
      { "<leader>gb", ":Git blame<CR>", desc = "[g]it [b]lame" },
      { "<leader>gf", ":Git fetch -p origin<CR>", desc = "[g]it [f]etch -p origin" },
      { "<leader>gp", ":Git pull<CR>", desc = "[g]it [p]ull" },
      { "<leader>gl", ":Git log<CR>", desc = "[g]it [l]og" },
      { "<leader>ga", ":Gwrite<CR>", desc = "[g]it [a]dd" },
      { "<leader>gu", ":Git add -u<CR>", desc = "[g]it [u]pdate" },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "-" },
      },
      on_attach = function(bufnr)
        local gitsigns = require("gitsigns")
        vim.keymap.set("n", "[h", function()
          gitsigns.nav_hunk("prev")
        end, { buffer = bufnr, desc = "prev [h]unk" })
        vim.keymap.set("n", "]h", function()
          gitsigns.nav_hunk("next")
        end, { buffer = bufnr, desc = "next [h]unk" })
        vim.keymap.set("n", "<leader>hp", function()
          gitsigns.preview_hunk()
        end, { buffer = bufnr, desc = "[h]unk [p]review" })
      end,
    },
  },
}
