local opt = require("plugins/configs/cmp")
opt.sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
}
return opt
