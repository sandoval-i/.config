local lsp_zero = require("lsp-zero")
local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp_zero.on_attach(function(client, bufnr)
  --
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  local opts = {buffer = bufnr}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = bufnr, desc = "[g]o to [d]efinition"})
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = "Hover"})
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, desc = "[v]iew [w]orkspace [s]ymbols"})
  -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end, { buffer = bufnr, desc = "[l]sp [c]ode [a]ction"})
  vim.keymap.set("n", "<leader>lrf", function() vim.lsp.buf.references() end, { buffer = bufnr, desc = "[l]sp [r]e[f]erences"})
  vim.keymap.set("n", "<leader>lrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "[l]sp [r]e[n]ame"})
  -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

-- setup language servers
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "clangd", "lua_ls", "tsserver" },
  handlers = {
    lsp_zero.default_setup,
    clangd = function()
      require("lspconfig").clangd.setup({
        capabilities = capabilities,
      })
    end,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls({
        capabilities = capabilities,
      })
      require("lspconfig").lua_ls.setup(lua_opts)
    end,
  },
})

cmp.setup({
  completion = {
    autocomplete = false,
  },
  sources = {
    { name = "nvim_lsp" },
  },
  formatting = lsp_zero.cmp_format(),
  mapping = cmp.mapping.preset.insert({
    ["<Tab>"] = cmp.mapping.confirm({select = true}),
    ["<C-y>"] = cmp.mapping.complete(),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
  })
})
