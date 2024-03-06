-- Telescope Settings
local wk = require("which-key")
wk.register({
        f = {
            name = "+telescope",
            f = { require("telescope.builtin").find_files, "Find Files" },
            g = { require("telescope.builtin").live_grep, "Live Grep" },
            b = { require("telescope.builtin").buffers, "Buffers" },
            h = { require("telescope.builtin").help_tags, "Help Tags" },
        }
    },
    {
        noremap = true,
        prefix = "<leader>"
    }
)
