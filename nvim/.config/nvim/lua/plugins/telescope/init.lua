local logger = require("utils.logger")

local ok, telescope = pcall(require, "telescope")
if not ok then
	logger.not_found("telescope")
	return
end

local keymaps = require("plugins.telescope.keymaps")

telescope.setup({
	defaults = {

		prompt_prefix = "   ",
		selection_caret = "契",
		path_display = { "smart" },

		file_ignore_patterns = { ".git", "node_modules" },

		mappings = keymaps.mappings,
	},
})
