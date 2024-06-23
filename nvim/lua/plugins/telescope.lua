local fzf = "nvim-telescope/telescope-fzf-native.nvim"

return {
  {
    fzf,
    build = "make",
    event = "VeryLazy"
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      fzf
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local keymap = vim.keymap

      keymap.set("n", "<leader>tr", builtin.resume, { desc = "[t]elescope [r]esume" })
      keymap.set("n", "<leader><space>", builtin.buffers, { desc = "[<Space>] Find existing buffers" })

      -- File pickers
      keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[s]earch [f]iles" })
      keymap.set("n", "<leader>sg", builtin.git_files, { desc = "[s]earch [g]it files" })
      keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[s]earch [h]elp" })

      -- Search pickers
      keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "[l]ive [g]rep" })
      keymap.set("n", "<leader>gw", builtin.grep_string, { desc = "[g]rep [w]ord under cursor" })

      -- Git pickers
      keymap.set("n", "<leader>gs", builtin.git_branches, { desc = "[g]it [s]witch" })

      -- Document pickers
      keymap.set("n", "<leader>lds", builtin.lsp_document_symbols, { desc = "[l]sp [d]ocument [s]ymbols" })
      keymap.set("n", "<leader>lws", builtin.lsp_dynamic_workspace_symbols , { desc = "[l]sp [w]orkspace [s]ymbols" })

      -- I don't use these as often. Consider removing?
      keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
      keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = "[/] Fuzzily search in current buffer" })

      local picker_mappings = {
        i = {
          ["<Down>"] = "preview_scrolling_down",
          ["<Up>"] = "preview_scrolling_up",

          ["<C-u>"] = "results_scrolling_up",
          ["<C-d>"] = "results_scrolling_down",
        }
      }

      telescope.setup({
        defaults = {
          mappings = picker_mappings
        },
        pickers = {
          git_branches = {
            mappings = picker_mappings
          }
        }
      })
      telescope.load_extension("fzf")
    end
  }
}
