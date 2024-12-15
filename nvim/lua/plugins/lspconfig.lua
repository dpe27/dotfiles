---@type NvPluginSpec
return {
  "neovim/nvim-lspconfig",
  config = function()
    -- load defaults i.e lua_lsp
    require("nvchad.configs.lspconfig").defaults()

    local lspconfig = require "lspconfig"

    local servers = {
      "html",
      "cssls",
      "bashls",
      "clangd",
      "docker_compose_language_service",
      "dockerls",
      "gopls",
      "jsonls",
      "rust_analyzer",
      "ts_ls",
      "sqls",
    }

    local nvlsp = require "nvchad.configs.lspconfig"

    -- lsps with default config
    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
      }
    end
<<<<<<< HEAD

    lspconfig.rust_analyzer.setup {
      on_attach = function(client, bufnr)
        local mode = vim.api.nvim_get_mode().mode
        vim.lsp.inlay_hint.enable(mode == "n" or mode == "v", { bufnr = bufnr })
      end,
      capabilities = nvlsp.capabilities,
      root_dir = function()
        return vim.fn.getcwd()
      end,
      cmd = { "rustup", "run", "stable", "rust-analyzer" },
      settings = {
        rust_analyzer = {
          useLibraryCodeForTypes = true,
          autoSearchPaths = true,
          autoImportCompletions = false,
          reportMissingImports = true,
          followImportForHints = true,

          cargo = {
            allFeatures = true,
          },
          checkOnSave = {
            command = "cargo clippy",
          },
        },
      },
    }
=======
>>>>>>> parent of cdf043d (update: rust_analyzer lspconfig (lmao!))
  end,
}
