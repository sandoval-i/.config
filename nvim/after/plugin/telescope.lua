local builtin = require("telescope.builtin")
local keymap = vim.keymap

keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[s]earch [f]iles" })
keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[s]earch [h]elp" })
keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[<Space>] Find existing buffers" })

-- I don't use these as often. Consider removing?
keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer" })
