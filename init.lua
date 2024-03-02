-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
vim.g.neovide_scroll_animation_length = 0.1
vim.opt.guifont = "FiraCode Nerd Font:h13"
vim.g.neovide_input_macos_alt_is_meta = true
vim.opt.relativenumber = true
