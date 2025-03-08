return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-d>"] = "results_scrolling_down",
            ["<C-u>"] = "results_scrolling_up",

            ["<Down>"] = "preview_scrolling_down",
            ["<Up>"] = "preview_scrolling_up",
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<C-d>"] = "delete_buffer",
            },
          },
        },
        lsp_definitions = {
          theme = "dropdown",
          show_line = false,
        },
      },
    },
    keys = function()
      local builtin = require("telescope.builtin")

      return {
        { "<leader>tr", builtin.resume, desc = "[t]elescope [r]esume" },
        { "<leader><space>", builtin.buffers, desc = "[<Space>] Find existing buffers" },

        -- File pickers
        { "<leader>sf", builtin.find_files, desc = "[s]earch [f]iles" },
        { "<leader>sg", builtin.git_files, desc = "[s]earch [g]it files" },
        { "<leader>sh", builtin.help_tags, desc = "[s]earch [h]elp" },

        -- Search pickers
        { "<leader>lg", builtin.live_grep, desc = "[l]ive [g]rep" },
        { "<leader>gw", builtin.grep_string, desc = "[g]rep [w]ord under cursor" },

        -- Git pickers
        { "<leader>gbr", builtin.git_branches, desc = "[g]it [br]anches" },
        { "<leader>gs", builtin.git_status, desc = "[g]it [s]tatus" },

        -- Lsp pickers
        { "<leader>lds", builtin.lsp_document_symbols, desc = "[l]sp [d]ocument [s]ymbols" },
        { "<leader>lws", builtin.lsp_dynamic_workspace_symbols, desc = "[l]sp [w]orkspace [s]ymbols" },
        { "<leader>lrf", builtin.lsp_references, desc = "[l]sp [r]eferences" },
        { "<leader>lic", builtin.lsp_incoming_calls, desc = "[l]sp [i]ncoming [c]alls" },
        { "gd", builtin.lsp_definitions, desc = "[g]o to [d]efinition" },

        -- TO DO: Learn how to use fuzzy search with regex to match files under src/** only

        -- I don't use these as often. Consider removing?
        { "<leader>?", builtin.oldfiles, desc = "[?] Find recently opened files" },
        {
          "<leader>/",
          function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
              winblend = 10,
              previewer = false,
            }))
          end,
          desc = "[/] Fuzzily search in current buffer",
        },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")

      telescope.setup(opts)
      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
  },
}
