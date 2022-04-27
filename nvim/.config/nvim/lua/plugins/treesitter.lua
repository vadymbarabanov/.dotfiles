local logger = require("utils.logger")

local ok, configs = pcall(require, "nvim-treesitter.configs")
if not ok then
	logger.not_found("nvim-treesitter.configs")
	return
end

configs.setup({
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"prisma",
		"rust",
		"lua",
		"go",
    "markdown",
		"html",
		"css",
		"scss",
		"svelte",
		"vue",
		"graphql",
		"json",
		"vim",
		"yaml",
		"toml",
	},
	sync_install = false,
	ignore_install = { "" }, -- List of parsers to ignore installing (for ensure_installed =  "all")
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})
