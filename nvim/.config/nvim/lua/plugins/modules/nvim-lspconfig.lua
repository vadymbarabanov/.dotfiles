return {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
        local lsp = require("lspconfig")

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

            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        end

        local lang_servers = { "tsserver", "gopls", "rust_analyzer" }

        for _, lang_server in ipairs(lang_servers) do
            lsp[lang_server].setup({
                on_attach = on_attach
            })
        end

        lsp["lua_ls"].setup({
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { "vim" },
                    }
                }
            }
        })

        lsp["eslint"].setup({
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end
        })

        lsp["jsonls"].setup({
            on_attach = on_attach,
            settings = {
                json = {
                    schemas = {
                        {
                            fileMatch = { 'package.json' },
                            url = "https://json.schemastore.org/package.json",
                        }
                    }
                }
            }
        })
    end,
}
