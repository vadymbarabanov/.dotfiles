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
        local format = vim.api.nvim_create_augroup("Format", { clear = false })
        vim.api.nvim_create_autocmd("BufWritePre", {
            command = "silent! lua vim.lsp.buf.format()",
            group = format,
            buffer = bufnr,
        })
    end

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
end

local lang_servers = {"tsserver", "gopls", "rust_analyzer"}

for _, lang_server in ipairs(lang_servers) do
    lsp[lang_server].setup({
        on_attach = on_attach
    })
end

