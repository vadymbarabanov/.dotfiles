local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
    vim.notify("nvim-treesitter not found")
    return
end

treesitter.setup({
    ensure_installed = {
        "javascript",
        "typescript",
        "go",
        "gomod",
        "lua",
        "html",
        "css",
        "scss",
        "tsx",
        "yaml",
        "toml",
        "json",
        "markdown",
    },
    auto_install = true,
    highlight = {
        enable = true,
    }
})
