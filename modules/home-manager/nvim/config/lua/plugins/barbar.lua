require("barbar").setup({
    icons = {
        buffer_index = true,
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
            [vim.diagnostic.severity.WARN] = { enabled = false },
            [vim.diagnostic.severity.INFO] = { enabled = false },
            [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        gitsigns = {
            added = { enabled = true, icon = '+' },
            changed = { enabled = true, icon = '~' },
            deleted = { enabled = true, icon = '-' },
        },
    }
})

local wk = require("which-key")

wk.register({
        b =
        {
            name = "+buffer",
            [","] = { '<Cmd>BufferPrevious<CR>', "Previous Buffer" },
            ["."] = { '<Cmd>BufferNext<CR>', "Next Buffer" },
            [">"] = { '<Cmd>BufferMovePrevious<CR>', "Move Previous Buffer" },
            ["<"] = { '<Cmd>BufferMoveNext<CR>', "Move Next Buffer" },
            ["1"] = { '<Cmd>BufferGoto 1<CR>', "Goto Buffer 1" },
            ["2"] = { '<Cmd>BufferGoto 2<CR>', "Goto Buffer 2" },
            ["3"] = { '<Cmd>BufferGoto 3<CR>', "Goto Buffer 3" },
            ["4"] = { '<Cmd>BufferGoto 4<CR>', "Goto Buffer 4" },
            ["5"] = { '<Cmd>BufferGoto 5<CR>', "Goto Buffer 5" },
            ["6"] = { '<Cmd>BufferGoto 6<CR>', "Goto Buffer 6" },
            ["7"] = { '<Cmd>BufferGoto 7<CR>', "Goto Buffer 7" },
            ["8"] = { '<Cmd>BufferGoto 8<CR>', "Goto Buffer 8" },
            ["9"] = { '<Cmd>BufferGoto 9<CR>', "Goto Buffer 9" },
            ["0"] = { '<Cmd>BufferLast<CR>', "Goto Last Buffer" },
            ["c"] = { '<Cmd>BufferClose<CR>', "Close Buffer" },
            ["p"] = { '<Cmd>BufferPin<CR>', "Pin Buffer" },
            ["P"] = { '<Cmd>BufferPick<CR>', "Pick Buffer" },
            ["b"] = { '<Cmd>BufferOrderByBufferNumber<CR>', "Order By Number" },
            ["d"] = { '<Cmd>BufferOrderByDirectory<CR>', "Order By Directory" },
            ["l"] = { '<Cmd>BufferOrderByLanguage<CR>', "Order By Language" },
            ["w"] = { '<Cmd>BufferOrderByWindowNumber<CR>', "Order By Window" },
        }
    },
    {
        prefix = "<leader>",
        noremap = true,
        silent = true
    })
