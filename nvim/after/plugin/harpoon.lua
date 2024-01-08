local harpoon = require("harpoon")
local keymap = vim.keymap
--
-- REQUIRED
harpoon:setup()
-- REQUIRED

keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "[a]ppend to Harpoon"})
keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
keymap.set("n", "<C-k>", function() harpoon:list():select(1) end)
keymap.set("n", "<C-l>", function() harpoon:list():select(2) end)

-- s (usable) 
-- f (usable)
--
-- k (usable)
-- l (usable)

-- keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
-- keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
-- keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
-- keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
