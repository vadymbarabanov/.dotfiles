return {
    "nvim-telescope/telescope.nvim",
    version = false,
    dependencies = { 
        "nvim-lua/plenary.nvim",
        "ahmedkhalf/project.nvim",
    },
    config = function()
        local actions = require("telescope.actions")
        local builtin = require("telescope.builtin")

        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = actions.close,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
            },
            pickers = {
                find_files = {
                    theme = "ivy",
                    previewer = false,
                },
                live_grep = { theme = "dropdown" },
            },
        })

        telescope.load_extension("projects")
        local projects = telescope.extensions.projects.projects

        local ivy = require("telescope.themes").get_ivy

        vim.keymap.set("n", "<C-p>", builtin.find_files, {})
        vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
        vim.keymap.set("n", "<C-g>", function() builtin.git_status(ivy({ previewer = false })) end, {})
        vim.keymap.set("n", "<C-b>", function() projects(ivy({ previewer = false })) end, {})

        -- LSP
        vim.keymap.set("n", "gr", function() builtin.lsp_references(ivy()) end)
    end
}

