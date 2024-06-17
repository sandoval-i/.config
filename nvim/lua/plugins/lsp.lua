local mason = "williamboman/mason.nvim"

local mason_lspconfig = "williamboman/mason-lspconfig.nvim"
local nvim_lspconfig = "neovim/nvim-lspconfig"

local cmp_nvim = "hrsh7th/nvim-cmp"
local cmp_lsp = "hrsh7th/cmp-nvim-lsp"

return {
  {
    mason_lspconfig,
    event = "VeryLazy",
    dependencies = {
      mason,
      nvim_lspconfig
    },
    config = true,
    opts = function()
      local lspconfig = require("lspconfig")
      local lsp_zero = require("lsp-zero")
      local lsp_cmp = require("cmp_nvim_lsp")

      return {
        ensure_installed = { "clangd", "dockerls", "docker_compose_language_service", "jsonls", "lua_ls", "pyright", "tsserver" },
        handlers = {
          lsp_zero.default_setup,

          clangd = function()
            lspconfig.clangd.setup({
              capabilities = lsp_cmp.default_capabilities(),
            })
          end,

          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls({
              capabilities = lsp_cmp.default_capabilities(),
            })
            lspconfig.lua_ls.setup(lua_opts)
          end,

          pyright = function()
            lspconfig.pyright.setup({
              capabilities = lsp_cmp.default_capabilities(),
            })
          end,
        },
      }
    end,
  },
  {
    cmp_nvim,
    event = "VeryLazy",
    dependencies = {
      nvim_lspconfig,
      cmp_lsp,
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path"
    },
    config = true,
    opts = function()
      local lsp_zero = require("lsp-zero")
      local cmp = require("cmp")
      local mapping = cmp.mapping

      cmp.setup.cmdline(":", {
        mapping = mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
            { name = 'cmdline' }
          }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })

      return {
        completion = {
          keyword_length = 3
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" }
        }, { name = "buffer" }),
        formatting = lsp_zero.cmp_format(),
        mapping = mapping.preset.insert({
          ["<Up>"] = mapping.scroll_docs(-4),
          ["<Down>"] = mapping.scroll_docs(4),

          ["<C-p>"] = mapping.select_prev_item(),
          ["<C-n>"] = mapping.select_next_item(),

          ["<C-e>"] = mapping.close(),
          ["<C-s>"] = mapping.complete(),
          ["<C-y>"] = mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Insert
          })
        })
      }
    end
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    event = "VeryLazy",
    dependencies = {
      mason,
      mason_lspconfig,
      nvim_lspconfig,
      cmp_lsp,
      cmp_nvim,
      {"L3MON4D3/LuaSnip"},
    },
    branch = "v3.x",
    config = function()
      require("lsp-zero").on_attach(
        function(_, bufnr)
          -- see :help lsp-zero-keybindings to learn the available actions
          vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, desc = "[g]o to [d]efinition"})
          vim.keymap.set("n", "<leader>lh", function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = "[l]sp [h]o[v]er"})
          vim.keymap.set("n", "<leader>lrf", function() vim.lsp.buf.references() end, { buffer = bufnr, desc = "[l]sp [r]e[f]erences"})
          vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = "[l]sp [c]ode [a]ctions"})
          vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "[l]sp [r]e[n]ame"})
          vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, { buffer = bufnr, desc = "]next [d]iagnostic"})
          vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, { buffer = bufnr, desc = "[prev [d]iagnostic"})
        end
      )
    end
  },
}

