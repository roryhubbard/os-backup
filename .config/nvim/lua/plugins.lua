return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'telescope-fzf-native.nvim',
    }
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },
  {
    "fenetikm/falcon",
    name = "falcon",
  },
  {
    "sainnhe/everforest",
    name = "everforest",
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  {
    "JuliaEditorSupport/julia-vim",
    name = "julia-vim",
    lazy = false,
  },
  {
    'tpope/vim-fugitive',
    cmd = 'Git',
    name = 'fugitive',
  },
  {
    'christoomey/vim-tmux-navigator',
    lazy = false,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    lazy = true,
    keys = { { "gm", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" } },
    config = function()
      vim.g.mkdp_auto_close = true
      vim.g.mkdp_open_to_the_world = false
      vim.g.mkdp_open_ip = "127.0.0.1"
      vim.g.mkdp_port = "8888"
      vim.g.mkdp_browser = ""
      vim.g.mkdp_echo_preview_url = true
      vim.g.mkdp_page_title = "${name}"
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    "mfussenegger/nvim-dap",
    lazy = false,
    config = function()
      local dap = require("dap")
      dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
          command = os.getenv('HOME') .. "/.local/share/nvim/mason/packages/codelldb/codelldb",
          args = {"--port", "${port}"},
          -- On windows you may have to uncomment this:
          -- detached = false,
        }
      }
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }
      dap.configurations.cpp = {
        {
          name = "codelldb",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
        {
          name = "gdb",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
        },
        {
          name = "simcore",
          type = "codelldb",
          request = "launch",
          program = "${workspaceFolder}/build/external_deps/bin/simcore",
          envFile = "${workspaceFolder}/build/generators/conanrun.env",
          args = {
            "-settings=/home/calvin/dev/VBatCocoIntegration/tests/integration/pac_tests/meteor/../../../../configs/",
            "-boot=/home/calvin/dev/VBatCocoIntegration/tests/integration/pac_tests/meteor/../../../../configs/sim/coco-boot.json",
            "-e=/home/calvin/.meteor/run_VBatCocoIntegration_20231112_150723/LaunchGotoLandSimcore/SimCoreLauncher/configs/final_edgeos_config.json",
            "/home/calvin/dev/VBatCocoIntegration/build/lib/edgeos",
            "/home/calvin/dev/VBatCocoIntegration/build/lib/edgeos/test",
            "/home/calvin/dev/VBatCocoIntegration/build/external_deps/lib/edgeos",
          },
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
        {
          name = "pac_int_test_runner",
          type = "codelldb",
          request = "launch",
          program = "${workspaceFolder}/build/bin/test/pac_int_test_runner",
          envFile = "${workspaceFolder}/build/generators/conanrun.env",
          args = {
            "--load_path=/home/calvin/dev/VBatCocoIntegration/build/lib/edgeos:/home/calvin/dev/VBatCocoIntegration/build/lib/edgeos/test:/home/calvin/dev/VBatCocoIntegration/build/external_deps/lib/edgeos",
            "run",
            "/home/calvin/.meteor/run_VBatCocoIntegration_20231118_005232/LaunchGotoLandAutopilot/EdgeOSCoreSerfLauncher/configs/final_edgeos_config.json",
          },
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    lazy = true,
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function()
      local path = os.getenv('HOME') .. "/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      local dap_python = require('dap-python')
      dap_python.setup(path)
      table.insert(require('dap').configurations.python, {
        type = 'python',
        request = 'launch',
        name = "meteor",
        cwd = '${workspaceFolder}',
--        program = "${workspaceFolder}/.venv/bin/meteor",
        module = "meteor",
        args = {"run", "${file}", "--no-dry", "-s", "-v", "--upload", "--hmd-url", "https://api.hmds.ai"},
        justMyCode = false,
        pythonPath = function()
          -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
          -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
          -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end;
      })
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = false,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end
  },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },
  {
    "williamboman/mason.nvim",
    config = true,
  },
  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
    },
    config = function()
      -- Here is where you configure the autocompletion settings.
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_cmp()
      -- And you can configure cmp even more, if you want to.
      local cmp = require('cmp')
      local cmp_action = lsp_zero.cmp_action()
      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        })
      })
    end
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason-lspconfig.nvim'},
    },
    config = function()
      -- This is where all the LSP shenanigans will live
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig()
      lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({buffer = bufnr})
      end)
      require('mason-lspconfig').setup({
        ensure_installed = {
          'azure_pipelines_ls',
          'bashls',
          'clangd',
          'cmake',
          'dagger', -- for cue
          'dockerls',
          'docker_compose_language_service',
      --    'gopls',
          'jsonls',
          'julials',
          'lua_ls',
          'marksman',
          'pyright',
          'rust_analyzer',
          'texlab',
          'yamlls',
          'tsserver',
          'rust_analyzer',
        },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            -- (Optional) Configure lua language server for neovim
            local lua_opts = lsp_zero.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
          end,
        },
      })
    end
  }
}
