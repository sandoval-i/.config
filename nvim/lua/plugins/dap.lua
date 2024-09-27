local mason = "williamboman/mason.nvim"
local nvim_dap = "mfussenegger/nvim-dap"

return {
  {
    nvim_dap,
    event = "VeryLazy",
    dependencies = { mason },
    keys = function()
      local client = require("dap")

      return {
        {
          "<leader>dc",
          function()
            client.continue()
          end,
          desc = "[d]ap [c]ontinue",
        },
        {
          "<leader>db",
          function()
            client.toggle_breakpoint()
          end,
          desc = "[d]ap [b]reakpoint",
        },
        {
          "<leader>1",
          function()
            client.step_into()
          end,
          desc = "step into",
        },
        {
          "<leader>2",
          function()
            client.step_over()
          end,
          desc = "step over",
        },
        {
          "<leader>3",
          function()
            client.step_out()
          end,
          desc = "step out",
        },
      }
    end,
    config = function()
      local client = require("dap")

      client.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {
            vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}",
          },
        },
      }

      for _, language in ipairs({ "typescript" }) do
        client.configurations[language] = {
          {
            name = "npm run test:no-script",
            type = "pwa-node",
            request = "launch",
            -- trace = true, -- include debugger info
            cwd = "${workspaceFolder}",
            runtimeExecutable = "npm",
            runtimeArgs = {
              "run",
              "test:no-script",
              "${relativeFile}",
            },
            skipFiles = {
              "${workspaceFolder}/node_modules/**/*",
              "<node_internals>/**/*",
            },
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
        }
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = { mason, nvim_dap },
    opts = {
      ensure_installed = { "js" },
      handlers = {},
    },
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { nvim_dap, "nvim-neotest/nvim-nio" },
    event = "VeryLazy",
    keys = {
      {
        "<leader>duit",
        function()
          require("dapui").toggle()
        end,
        desc = "[d]ap[u][i] [t]oggle",
      },
    },
    config = true,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    dependencies = { nvim_dap, "nvim-treesitter/nvim-treesitter" },
    config = true,
  },
}
