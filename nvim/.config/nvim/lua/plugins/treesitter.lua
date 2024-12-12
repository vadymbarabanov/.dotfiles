return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local langs = {
            "html",
            "css",
            "scss",
            "javascript",
            "typescript",
            "tsx",
            "go",
            "zig", 
        }

        require("nvim-treesitter.configs").setup({
            ensure_installed = langs,
            highlight = { enable = true },
        })
    end,
}

