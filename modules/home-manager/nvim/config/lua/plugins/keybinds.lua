require("legendary").setup({
    -- Include builtins by default, set to false to disable
    include_builtin = true,
    -- Customize the prompt that appears on your vim.ui.select() handler
    select_prompt = "Legendary",
})

require("which-key").setup()

local wk = require("which-key")
wk.register({
    fk = { "<cmd>Legendary<cr>", "Telescope: Legendary" },
}, { prefix = "<leader>" })