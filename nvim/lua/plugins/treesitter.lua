local treesitter = "nvim-treesitter/nvim-treesitter"

return {
  {
    treesitter,
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
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
      })
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
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
        callback = function()
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(0))
          if ok and stats and stats.size > max_filesize then
            return true
          end
          -- syntax highlighting, provided by Neovim
          vim.treesitter.start()
          -- indentation, provided by nvim-treesitter
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

          -- folds, provided by Neovim
          -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
          -- vim.wo.foldmethod = "expr"
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { treesitter },
    --[[ textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
        },
      },

      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]s"] = "@function.outer",
        },
        goto_previous_start = {
          ["[s"] = "@function.outer",
        },

        goto_next_end = {
          ["]e"] = "@function.outer",
        },
        goto_previous_end = {
          ["[e"] = "@function.outer",
        },
      },
    }, ]]
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
