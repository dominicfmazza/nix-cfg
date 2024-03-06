require("gitsigns").setup({
    signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "▎" },
        topdelete = { text = "契" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
    },
})

local wk = require("which-key")
wk.register({
        g = {
            name = "+git",
            l = { function() require("gitsigns").blame_line() end, desc = "View Git blame" },
            L = { function() require("gitsigns").blame_line { full = true } end, desc = "View full Git blame" },
            p = { function() require("gitsigns").preview_hunk() end, desc = "Preview Git hunk" },
            h = { function() require("gitsigns").reset_hunk() end, desc = "Reset Git hunk" },
            r = { function() require("gitsigns").reset_buffer() end, desc = "Reset Git buffer" },
            s = { function() require("gitsigns").stage_hunk() end, desc = "Stage Git hunk" },
            S = { function() require("gitsigns").stage_buffer() end, desc = "Stage Git buffer" },
            u = { function() require("gitsigns").undo_stage_hunk() end, desc = "Unstage Git hunk" },
            d = { function() require("gitsigns").diffthis() end, desc = "View Git diff" },
        }
    },
    { prefix = "<leader>" }
)

wk.register({
    ["]g"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" },
    ["[g"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" },
})
