return {
    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre' -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            return require "configs.lspconfig"
        end,
    },

    {
        "mfussenegger/nvim-lint",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local opt = require "configs.linter"
            require("lint").linters_by_ft = opt
        end,
    },

    -- {
    -- 	"williamboman/mason.nvim",
    -- 	opts = {
    -- 		ensure_installed = {
    -- 			"lua-language-server", "stylua",
    -- 			"html-lsp", "css-lsp" , "prettier"
    -- 		},
    -- 	},
    -- },
    --
    {
        "hrsh7th/nvim-cmp",
        opts = function()
            return require "configs.cmp"
        end,
        config = function(_, opts)
            require("cmp").setup(opts)
        end,
    },

    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = function()
            return require "configs/nvimtree"
        end,
        config = function(_, opts)
            dofile(vim.g.base46_cache .. "nvimtree")
            require("nvim-tree").setup(opts)
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim", "lua", "vimdoc", "html", "css", "python",
                "cpp", "c", "rust", "perl", "ssh_config"
            },
        },
    },
}
