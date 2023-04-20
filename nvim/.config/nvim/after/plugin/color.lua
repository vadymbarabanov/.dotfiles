local ok = pcall(require, "vscode")
if not ok then
    vim.notify("vscode theme not found")
    return
end

vim.cmd.colorscheme("vscode")
