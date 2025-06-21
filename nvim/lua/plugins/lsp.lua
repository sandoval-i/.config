local mason = "mason-org/mason.nvim"
local mason_lspconfig = "mason-org/mason-lspconfig.nvim"
local nvim_lspconfig = "neovim/nvim-lspconfig"
local blink = "saghen/blink.cmp"

return {
  {
    mason,
    config = true,
  },
  {
    mason_lspconfig,
    dependencies = {
      mason,
      nvim_lspconfig,
      blink,
    },
    opts = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      return {
        ensure_installed = {
          "bashls",
          "clangd",
          "dockerls",
          "jsonls",
          "lua_ls",
          "pyright",
          "terraformls",
          "ts_ls",
        },
        handlers = {
          clangd = function()
            lspconfig.clangd.setup({
              capabilities = capabilities,
              init_options = {
                fallbackFlags = { "-std=c++20" },
              },
            })
          end,

          lua_ls = function()
            lspconfig.lua_ls.setup({ capabilities = capabilities })
          end,

          pyright = function()
            lspconfig.pyright.setup({ capabilities = capabilities })
          end,

          ts_ls = function()
            lspconfig.ts_ls.setup({ capabilities = capabilities })
          end,
        },
      }
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          vim.keymap.set("n", "<leader>lca", function()
            vim.lsp.buf.code_action()
          end, { buffer = args.buf, desc = "[l]sp [c]ode [a]ctions" })
          vim.keymap.set("n", "<leader>lrn", function()
            vim.lsp.buf.rename()
          end, { buffer = args.buf, desc = "[l]sp [r]e[n]ame" })
          vim.keymap.set("n", "]d", function()
            vim.diagnostic.goto_next()
          end, { buffer = args.buf, desc = "]next [d]iagnostic" })
          vim.keymap.set("n", "[d", function()
            vim.diagnostic.goto_prev()
          end, { buffer = args.buf, desc = "[prev [d]iagnostic" })
        end,
      })

      require("mason-lspconfig").setup(opts)
    end,
  },
}
