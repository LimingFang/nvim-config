---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-t>"] = ""
  },
  i = {
    ["<C-t>"] = ""
  },
}

M.general = {
  n = {
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- lint
    ["<leader>l"] = {
        function()
          require("lint").try_lint()
        end,
        "lint"
    }
  },
  v = {
    [">"] = { ">gv", "indent"},

    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    }
  },
}

-- more keybinds!
M.telescope = {
    n = {
        ["<leader>fg"] = { "<cmd> Telescope git_files <CR>", "Find Git Files" },
    },
}

return M
