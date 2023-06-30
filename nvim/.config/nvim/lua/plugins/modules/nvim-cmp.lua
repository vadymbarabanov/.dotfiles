return {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "hrsh7th/cmp-buffer" },
        { "onsails/lspkind.nvim" },
        { "dcampos/nvim-snippy" },
        { "dcampos/cmp-snippy" },
    },
    config = function()
        local lspkind = require("lspkind")
        local cmp = require("cmp")

        cmp.setup({
            formatting = {
                format = lspkind.cmp_format({
                    mode = "text",
                    maxwidth = 50,
                    ellipsis_char = "...",
                })
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-e>"] = cmp.mapping.close(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
                ["<Tab>"] = cmp.mapping.select_next_item(),
                ["<S-Tab>"] = cmp.mapping.select_prev_item(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "snippy" },
            }, {
                { name = "buffer" },
            }),
            snippet = {
                expand = function(args)
                    require("snippy").expand_snippet(args.body)
                end
            },
        })
    end,
}
