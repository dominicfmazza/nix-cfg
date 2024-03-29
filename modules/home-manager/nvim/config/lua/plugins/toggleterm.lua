require("toggleterm").setup({})
local Terminal = require('toggleterm.terminal').Terminal

local lazygit  = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "double",
    },
    -- function to run on opening the terminal
    on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    end,
    -- function to run on closing the terminal
    on_close = function(term)
        vim.cmd("startinsert!")
    end,
})

function _lazygit_toggle()
    lazygit:toggle()
end

local wk = require("which-key")
wk.register({ g = { name = "+git", g = { "<cmd>lua _lazygit_toggle()<CR>", "LazyGit" } } },
    { noremap = true, silent = true, prefix = "<leader>" })
wk.register({
        t = {
            name = "+terminal",
            l = { "<cmd>lua _lazygit_toggle()<CR>", "LazyGit" },
            v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },     -- vertical
            h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" }, -- horizontal
            f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },                   -- float
        }
    },
    { noremap = true, silent = true, prefix = "<leader>" }
)
