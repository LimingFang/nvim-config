local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local user_on_attach = function (client, bufnr)
    client.resolved_capabilities.hover = false
    client.server_capabilities.semanticTokensProvider = vim.NIL
    on_attach(client, bufnr)
end

lspconfig.rust_analyzer.setup {
  on_attach = user_on_attach,
  capabilities = capabilities,
  settings = {
    ['rust-analyzer'] = {
      check = {
        extraArgs = {"--target", "riscv64gc-unknown-none-elf"};
        allTargets = false;
      }
    }
  }
}

lspconfig.clangd.setup {
  on_attach = on_attach,
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
-- 
-- lspconfig.pyright.setup { blabla}
