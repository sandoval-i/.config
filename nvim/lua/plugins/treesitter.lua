local treesitter = "nvim-treesitter/nvim-treesitter"

return {
  {
    treesitter,
    event = "VeryLazy",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = {
        "cpp",
        "diff",
        "json",
        "lua",
        "python",
        "terraform",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
      disable = function(_, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          }
        },

        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]s"] = "@function.outer"
          },
          goto_previous_start = {
            ["[s"] = "@function.outer"
          },

          goto_next_end = {
            ["]e"] = "@function.outer"
          },
          goto_previous_end = {
            ["[e"] = "@function.outer"
          }
        }
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { treesitter },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = {
      max_lines = 3,
    },
    keys = {
      {
        "[c",
        function()
          require("treesitter-context").go_to_context(vim.v.count1)
        end,
      },
    },
  },
}
