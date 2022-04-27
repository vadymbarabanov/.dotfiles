local logger = require("utils.logger")

local ok, null_ls = pcall(require, "null-ls")
if not ok then
	logger.not_found("null-ls")
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local function format_on_save(client)
	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
	end
end

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.stylua,
		formatting.gofmt,

		diagnostics.eslint,
		diagnostics.golangci_lint,
	},

	on_attach = format_on_save,
})
