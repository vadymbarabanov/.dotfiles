local logger = require("utils.logger")

local colorscheme = "darkplus"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not ok then
	logger.warn("Colorscheme " .. colorscheme .. " not found.")
	return
end
