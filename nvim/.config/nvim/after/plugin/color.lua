--[[
local ok = pcall(require, "vscode")
if not ok then
    vim.notify("vscode theme not found")
    return
end

vim.cmd.colorscheme("vscode")
--]]
local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
    vim.notify("catppuccin theme not found")
    return
end

catppuccin.setup({
    flavour = "frappe",
})

vim.cmd.colorscheme("catppuccin")
