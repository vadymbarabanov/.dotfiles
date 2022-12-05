local ok, lsp = pcall(require, "lspconfig")
if not ok then
    vim.notify("lspconfig not found")
    return
end

local protocol = require('vim.lsp.protocol')

local on_attach = function(client, bufnr)
    -- Formatting
    if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
        vim.api.nvim_command [[augroup End]]
    end
end

-- Typescript
lsp.tsserver.setup({
    on_attach = on_attach
})

-- Deno
vim.g.markdown_fenced_languages = {
    "ts=typescript"
}
lsp.denols.setup({})

-- Golang
lsp.golangci_lint_ls.setup({})
lsp.gopls.setup({})
