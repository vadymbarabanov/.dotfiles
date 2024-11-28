return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "html", "css", "scss", "javascript", "typescript", "tsx", "go", "zig" },
            highlight = { enable = true },
        })
    end,
}

