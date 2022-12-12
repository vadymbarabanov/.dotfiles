local ok, git = pcall(require, "git")
if not ok then
    vim.notify("git (dinhhuy258) not found")
    return
end

git.setup({})
