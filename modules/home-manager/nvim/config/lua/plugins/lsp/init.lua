local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require('lspconfig')

require("legendary").keymaps({
    { '<space>e', vim.diagnostic.open_float, mode = { 'n' } },
    { '[d',       vim.diagnostic.goto_prev,  mode = { 'n' } },
    { ']d',       vim.diagnostic.goto_next,  mode = { 'n' } },
    { '<space>q', vim.diagnostic.setloclist, mode = { 'n' } }, })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        require("legendary").keymaps({
            { 'gD',        vim.lsp.buf.declaration,             opts = opts, mode = { 'n' } },
            { 'gd',        vim.lsp.buf.definition,              opts = opts, mode = { 'n' } },
            { 'K',         vim.lsp.buf.hover,                   opts = opts, mode = { 'n' } },
            { 'gi',        vim.lsp.buf.implementation,          opts = opts, mode = { 'n' } },
            { '<C-k>',     vim.lsp.buf.signature_help,          opts = opts, mode = { 'n' } },
            { '<space>wa', vim.lsp.buf.add_workspace_folder,    opts = opts, mode = { 'n' } },
            { '<space>wr', vim.lsp.buf.remove_workspace_folder, opts = opts, mode = { 'n' } },
            {
                '<space>wl',
                function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end,
                opts = opts,
                mode = { 'n' }
            },
            { '<space>D',  vim.lsp.buf.type_definition, opts = opts, mode = { 'n' } },
            { '<space>rn', vim.lsp.buf.rename,          opts = opts, mode = { 'n' } },
            { '<space>ca', vim.lsp.buf.code_action,     opts = opts, mode = { 'n', 'v' } },
            { 'gr',        vim.lsp.buf.references,      opts = opts, mode = { 'n' } },
            {
                '<space>f',
                function()
                    vim.lsp.buf.format { async = true }
                end,
                opts = opts,
                mode = { 'n' }
            } })
    end,
})

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'nil_ls' }
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        -- on_attach = my_custom_on_attach,
        capabilities = capabilities,
    }
end


-- Set up servers based on other configs
require("plugins.lsp.luals")

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'

require("legendary").keymaps({
    { '<C-u>',     cmp.mapping.scroll_docs(-4) },
    { '<C-d>',     cmp.mapping.scroll_docs(4) },
    { '<C-Space>', cmp.mapping.complete() },
    { '<CR>', cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
    }
    },
    {
        '<Tab>',
        cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                else
                    fallback()
                end
            end,
            { 'i', 's' })
    },
    {
        '<S-Tab>',
        cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { 'i', 's' })
    },
})

cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    },
}
