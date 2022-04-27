local logger = require("utils.logger")

local ok, _ = pcall(require, "lspconfig")
if not ok then
	logger.not_found("lspconfig")
	return
end

require("plugins.lsp.lsp-installer")
require("plugins.lsp.handlers").setup()
require("plugins.lsp.null-ls")
