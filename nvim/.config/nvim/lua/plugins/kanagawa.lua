return {
    "rebelot/kanagawa.nvim",
    config = function()
        require("kanagawa").setup({
            theme = "dragon",
            background = {
                dark = "dragon",
                light = "lotus",
            },
        })
        vim.cmd.colorscheme("kanagawa")
    end,
}
