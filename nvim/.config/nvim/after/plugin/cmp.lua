local ok, cmp = pcall(require, "cmp")
if not ok then
    vim.notify("cmp not found")
    return
end

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ["<C-e>"] =  cmp.mapping.close(),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({select = true}),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({{name = "nvim_lsp"}}, {{name = "buffer"}})
})
