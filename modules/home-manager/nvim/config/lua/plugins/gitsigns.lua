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
            l = { function() require("gitsigns").blame_line() end, "Blame" },
            L = { function() require("gitsigns").blame_line { full = true } end, "Full Blame" },
            p = { function() require("gitsigns").preview_hunk() end, "Preview Hunk" },
            h = { function() require("gitsigns").reset_hunk() end, "Reset Hunk" },
            r = { function() require("gitsigns").reset_buffer() end, "Reset Buffer" },
            s = { function() require("gitsigns").stage_hunk() end, "Stage Hunk" },
            S = { function() require("gitsigns").stage_buffer() end, "Stage Buffer" },
            u = { function() require("gitsigns").undo_stage_hunk() end, "Unstage Hunk" },
            d = { function() require("gitsigns").diffthis() end, "View Diff" },
        }
    },
    { prefix = "<leader>" }
)

wk.register({
    ["]g"] = { function() require("gitsigns").next_hunk() end, desc = "Next Git hunk" },
    ["[g"] = { function() require("gitsigns").prev_hunk() end, desc = "Previous Git hunk" },
})
