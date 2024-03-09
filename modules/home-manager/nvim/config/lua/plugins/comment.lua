require("Comment").setup({
    mappings = {
        basic = false,
        extra = false,
    },
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
})

local wk = require("which-key")
wk.register({
    ["/"] = {
        function()
            require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
        end,
        "Toggle linewise comment"
    },
}, {
    prefix = "<leader>",
    mode = "n"
})

wk.register({
    ["/"] = {
        "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
        "Toggle block comment"
    },
}, {
    prefix = "<leader>",
    mode = "v"
})
