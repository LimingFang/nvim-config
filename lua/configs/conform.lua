local options = {
    lsp_fallback = false,

    formatters_by_ft = {
        lua = { "stylua" },
        -- css = { "prettier" },
        -- html = { "prettier" },
        python = { "autopep8" },
        javascript = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        cpp = { "clang_format" },
        sh = { "shfmt" },
    },
    formatters = {
        shfmt = {
            command = "shfmt",
            args = { "-i", "2", "-filename", "$FILENAME" },
        }
    },
    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
    --
}

require("conform").setup(options)
