local ok, lsp = pcall(require, "lspconfig")
if not ok then
    vim.notify("lspconfig not found")
    return
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Formatting on save
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command([[augroup Format]])
        vim.api.nvim_command([[autocmd! * <buffer>]])
        vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
        vim.api.nvim_command([[augroup End]])
    end

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
end

-- Typescript
lsp["tsserver"].setup({
    on_attach = on_attach
})

-- Deno
vim.g.markdown_fenced_languages = {
    "ts=typescript"
}
lsp["denols"].setup({
    on_attach = on_attach
})

-- Golang
lsp["golangci_lint_ls"].setup({
    on_attach = on_attach
})
lsp["gopls"].setup({
    on_attach = on_attach
})
