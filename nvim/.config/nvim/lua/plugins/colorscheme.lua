return {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
        require("lackluster").setup()
        vim.cmd.colorscheme("lackluster-hack")
    end,
}
