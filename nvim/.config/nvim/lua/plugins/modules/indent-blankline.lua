return {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    opts = {
        char = "│",
        filetype_exclude = { "help", "lazy" },
        show_trailing_blankline_indent = false,
        show_current_context = true,
    },
}
