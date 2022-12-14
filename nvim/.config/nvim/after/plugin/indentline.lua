local ok, indentline = pcall(require, "indent_blankline")
if not ok then
    vim.notify("indent-blankline plugin not found")
    return
end

indentline.setup({
    show_current_context = true,
})
