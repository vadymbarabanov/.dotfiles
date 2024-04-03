return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter").setup({
            ensure_installed = {
                "html",
                "css",
                "javascript",
                "typescript",
                "tsx",
                "rust",
                "go",
                "gomod",
                "lua",
                "yaml",
                "toml",
                "json",
                "zig",
            },
            auto_install = true,
            highlight = {
                enable = true,
            },
        })
    end,
}

