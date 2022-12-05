local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank (copy)
augroup("YankHighlight", {clear = true})
autocmd("TextYankPost", {
    group = "YankHighlight",
    callback = function()
        vim.highlight.on_yank({higroup = "Search", timeout = "200"})
    end,
})

-- Remove whitespaces at the end of each line on save
autocmd("BufWritePre", {
    pattern = "*",
    command = ":%s/\\s\\+$//e",
})

-- Global status line
vim.cmd([[highlight WinSeparator guibg=None]])

