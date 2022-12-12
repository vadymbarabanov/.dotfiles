local ok, git = pcall(require, "gitsigns")
if not ok then
    vim.notify("gitsigns not found")
    return
end

git.setup({})

