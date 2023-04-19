local ok, autopairs = pcall(require, "nvim-autopairs")
if not ok then
    vim.notify("autoparis not found")
    return
end

autopairs.setup()
