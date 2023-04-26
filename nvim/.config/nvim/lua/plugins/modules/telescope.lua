return {
    'nvim-telescope/telescope.nvim',
    version = false,
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
    },
    config = function()
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<C-p>", builtin.find_files, {})
        vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
        vim.keymap.set("n", "<C-b>", builtin.buffers, {})

        require('telescope').setup({
            defaults    = {
                file_ignore_patterns = {
                    "node_modules",
                    "package-lock.json",
                    ".git",
                },
                mappings             = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    }
                },
                layout_strategy      = "vertical",
                layout_config        = {
                    vertical = { width = 0.5 },
                },
            },
            border      = {},
            borderchars = nil,
            pickers     = {
                find_files = {
                    theme = "dropdown",
                },
                live_grep = {
                    theme = "dropdown",
                },
                buffers = {
                    theme = "dropdown",
                }
            },
        })
    end
}
