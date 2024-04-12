return {
    "stevearc/oil.nvim",
    config = function()
        local oil = require("oil")
        oil.setup({
            default_file_explorer = true,
        })

        vim.keymap.set(
            "n",
            "-",
            function() oil.open(oil.get_current_dir()) end,
            { desc = "Opens parent directory" }
        )
    end,
}
