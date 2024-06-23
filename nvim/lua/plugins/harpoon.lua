return {
  "ThePrimeagen/harpoon",
  event = "VeryLazy",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local harpoon = require("harpoon")
    local keymap = vim.keymap

    harpoon:setup({
      settings = {
        save_on_toggle = true,
        save_on_ui_close = true,
      }
    })

    keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "[h]arpoon [a]dd"})
    keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
    keymap.set("n", "<C-s>", function() harpoon:list():select(1) end)
    keymap.set("n", "<C-f>", function() harpoon:list():select(2) end)
    keymap.set("n", "<C-k>", function() harpoon:list():select(3) end)
    keymap.set("n", "<C-l>", function() harpoon:list():select(4) end)
  end,
}
