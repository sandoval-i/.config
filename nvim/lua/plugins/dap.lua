local mason = "williamboman/mason.nvim"
local nvim_dap = "mfussenegger/nvim-dap"

return {
  {
    nvim_dap,
    event = "VeryLazy",
    config = function()
      local client = require("dap")

      vim.keymap.set("n", "<leader>dc", function() client.continue() end, { desc = "[d]ap [c]ontinue" })
      vim.keymap.set("n", "<leader>db", function() client.toggle_breakpoint() end, { desc = "[d]ap [b]reakpoint" })
      vim.keymap.set('n', '<leader>1', function() client.step_into() end)
      vim.keymap.set('n', '<leader>2', function() client.step_over() end)
      vim.keymap.set('n', '<leader>3', function() client.step_out() end)

      client.adapters["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          command = "node",
          args = {vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js", "${port}"},
        }
      }

      for _, language in ipairs({ "typescript", "javascript" }) do
        client.configurations[language] = {
          --[[ {
            name = "npm run dev", // Maybe configure to attach someday?
            type = "pwa-node",
            request = "launch",
            processId = require'dap.utils'.pick_process,
            cwd = "${workspaceFolder}",
            port = "9229"
          }, ]]
          {
            name = "npm run dev",
            type = "pwa-node",
            request = "launch",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "npm",
            runtimeArgs = {
              "run",
              "dev",
            },
            skipFiles = {
              "${workspaceFolder}/node_modules/**/*",
              "<node_internals>/**/*"
            },
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
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
              "${fileBasename}"
            },
            skipFiles = {
              "${workspaceFolder}/node_modules/**/*",
              "<node_internals>/**/*"
            },
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          }
        }
      end

    end
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {mason, nvim_dap},
    opts = {
      ensure_installed = {"js"},
      handlers = {}
    },
    config = true
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {nvim_dap, "nvim-neotest/nvim-nio"},
    config = function()
      local ui = require("dapui")
      vim.keymap.set("n", "<leader>duit", function() ui.toggle() end, { desc = "[d]ap[u][i] [t]oggle" })
      ui.setup()
    end
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "VeryLazy",
    dependencies = {nvim_dap, "nvim-treesitter/nvim-treesitter"},
    config = true
  },
}
