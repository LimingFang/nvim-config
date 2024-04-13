local opt = require("nvchad.configs.cmp")
opt.sources = {
  { name = "nvim_lsp", keyword_length = 4 },
  { name = "buffer", keyword_length = 3},
  { name = "path" },
}
return opt
