local ok, git = pcall(require, "gitsigns")
if not ok then
    vim.notify("gitsigns not found")
    return
end

git.setup({
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '│' },
    },
})
