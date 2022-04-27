local logger = require("utils.logger")

local ok, wk = pcall(require, "which-key")
if not ok then
	logger.not_found("which-key")
	return
end

local config_ok, config = pcall(require, "plugins.whichkey.config")
if not config_ok then
	logger.warn("which-key config not found")
	return
end

local keymaps_ok, keymaps = pcall(require, "plugins.whichkey.keymaps")
if not keymaps_ok then
	logger.warn("which-key keymaps notfound")
	return
end

wk.setup(config.setup)
wk.register(keymaps.mappings, config.opts)
wk.register(keymaps.vmappings, config.vopts)
