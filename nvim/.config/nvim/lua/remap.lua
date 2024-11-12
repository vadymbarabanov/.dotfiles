vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function remap(mode, value, target, opts)
    local _opts = { noremap = true, silent = true }

    if opts then
        for k, v in pairs(opts) do _opts[k] = v end
    end

    vim.api.nvim_set_keymap(mode, value, target, _opts)
end

-- Better windows navigation
remap("n", "<C-h>", "<C-w>h")
remap("n", "<C-j>", "<C-w>j")
remap("n", "<C-k>", "<C-w>k")
remap("n", "<C-l>", "<C-w>l")

-- Move line up and down
remap("n", "<A-j>", ":m .+1<CR>==")
remap("n", "<A-k>", ":m .-2<CR>==")

-- Move line up and down (visual block)
remap("x", "<A-j>", ":move '>+1<CR>gv-gv")
remap("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- Stay in indent mode
remap("v", "<", "<gv")
remap("v", ">", ">gv")

-- Go half a screen and center
remap("n", "<C-u>", "<C-u>zz")
remap("n", "<C-d>", "<C-d>zz")

-- Do not replace 'copy' register with paste and delete
remap("x", "p", "\"_dP")
remap("n", "x", "\"_x")
remap("n", "d", "\"_d")

-- Close active buffer
remap("n", "<C-w>", "<C-w>q", { nowait = true })

-- Resize split
remap("n", "<A-up>", "<C-w>+")
remap("n", "<A-down>", "<C-w>-")
remap("n", "<A-left>", "<C-w><")
remap("n", "<A-right>", "<C-w>>")

vim.api.nvim_set_keymap("n", "S", ":%s//g<Left><Left>", { noremap = true })
