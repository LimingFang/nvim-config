-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "tsserver" }

local user_on_attach = function(client, bufnr)
  client.resolved_capabilities.hover = false
  client.server_capabilities.semanticTokensProvider = nil
  on_attach(client, bufnr)
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = user_on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

lspconfig.rust_analyzer.setup {
  on_attach = user_on_attach,
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      check = {
        extraArgs = { "--target", "riscv64gc-unknown-none-elf" },
        allTargets = false,
      }
    }
  }
}

lspconfig.clangd.setup {
  autostart = false,
  on_attach = user_on_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "-j=4",
    "--background-index",
    "--header-insertion=never",
    "--completion-style=detailed",
  }
}

lspconfig.pyright.setup {
  on_attach = user_on_attach,
  capabilities = capabilities,
  settings = {
    pyright = {
      pythonPath = "/opt/homebrew/bin/python3",
    }
  }
}

lspconfig.lua_ls.setup {
  on_attach = user_on_attach,
  capabilities = capabilities,
  autostart = false,
  on_init = on_init,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
          [vim.fn.stdpath "data" .. "/lazy/ui/nvchad_types"] = true,
          [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    }
  }
}
