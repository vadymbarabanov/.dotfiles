local logger = require("utils.logger")

local ok, _ = pcall(require, "lspconfig")
if not ok then
	logger.not_found("lspconfig")
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
