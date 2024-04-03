local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Highlight on yank (copy)
augroup("YankHighlight", {clear = true})
autocmd(
    "TextYankPost",
    {
        group = "YankHighlight",
        callback = function()
            vim.highlight.on_yank({higroup = "Search", timeout = "200"})
        end
    }
)

-- Show cursor line only in active window
local cursorGrp = augroup("CursorLine", {clear = true})
autocmd(
    {"InsertLeave", "WinEnter"},
    {
        pattern = "*",
        command = "set cursorline",
        group = cursorGrp,
    }
)
autocmd(
    {"InsertEnter", "WinLeave"},
    {
        pattern = "*",
        command = "set nocursorline",
        group = cursorGrp,
    }
)

-- Stop commenting new line
autocmd(
    "BufEnter",
    {
        pattern = "*",
        command = "setlocal formatoptions-=cro"
    }
)

-- Go to last cursor position when opening a buffer
autocmd(
    "BufReadPost",
    {
        callback = function()
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            local lcount = vim.api.nvim_buf_line_count(0)
            if mark[1] > 0 and mark[1] <= lcount then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
        end
    }
)

