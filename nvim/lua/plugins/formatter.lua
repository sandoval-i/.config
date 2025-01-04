local mason = "williamboman/mason.nvim"
local conform = "stevearc/conform.nvim"

return {
  {
    conform,
    cmd = { "ConformInfo" },
    opts = {
      formatters = {
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
      formatters_by_ft = {
        cpp = { "clang-format" },
        html = { "prettierd" },
        json = { "jq" },
        lua = { "stylua" },
        typescript = { "eslint_d", "prettierd" },
        yaml = { "prettierd" },
      },
    },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format()
        end,
        "[f]ormat buffer",
      },
    },
  },
  {
    "zapling/mason-conform.nvim",
    dependencies = { mason, conform },
    opts = {
      ensure_installed = { "clang-format", "prettierd", "jq", "stylua", "eslint_d", "prettierd" },
    },
  },
}
