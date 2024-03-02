--type conform.options
local options = {
	lsp_fallback = false,

	formatters_by_ft = {
		lua = { "stylua" },

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
    }

  -- adding same formatter for multiple filetypes can look too much work for some
  -- instead of the above code you could just use a loop! the config is just a table after all!

	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

require("conform").setup(options)
