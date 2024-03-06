require("neo-tree").setup({})

local wk = require("which-key")

wk.register({
    e = {"<cmd>Neotree toggle<cr>", "Neotree: Toggle"},
    o = {"<cmd>Neotree focus<cr>", "Neotree: Focus"},
}, {prefix="<leader>"})
