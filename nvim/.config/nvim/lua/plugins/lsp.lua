return {
    "neovim/nvim-lspconfig",
    config = function()
        local lsp = require("lspconfig")

        local bufopts = { noremap = true, silent = true, buffer = buf }
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

        vim.keymap.set("n", "<leader>e", function() vim.diagnostic.open_float(0, { scope = "line" }) end)
        vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
        vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action)

        vim.keymap.set('n', '<leader>d[', vim.diagnostic.goto_prev)
        vim.keymap.set('n', '<leader>d]', vim.diagnostic.goto_next)

        local on_attach = function(client, bufnr)
            if client.server_capabilities.documentFormattingProvider then 
                local format = vim.api.nvim_create_augroup("Format", { clear = false })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    command = "silent! lua vim.lsp.buf.format()",
                    group = format,
                    buffer = bufnr,
                })
            end
        end

        lsp["ts_ls"].setup({
            -- TODO: I want diffrent formatters per project
            -- on_attach = on_attach,
            init_options = {
                preferences = {
                    importModuleSpecifierPreference = "relative", 
                },
            },
        })

        lsp["gopls"].setup({ on_attach = on_attach })

        lsp["zls"].setup({ on_attach = on_attach })
    end,
}

