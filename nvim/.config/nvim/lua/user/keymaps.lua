local opts = { noremap = true, silent = true }

local function remap(mode, value, target)
	vim.api.nvim_set_keymap(mode, value, target, opts)
end

--Remap space as leader key
remap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
remap("n", "<C-h>", "<C-w>h")
remap("n", "<C-j>", "<C-w>j")
remap("n", "<C-k>", "<C-w>k")
remap("n", "<C-l>", "<C-w>l")

-- Resize with arrows
remap("n", "<C-Up>", ":resize -2<CR>")
remap("n", "<C-Down>", ":resize +2<CR>")
remap("n", "<C-Left>", ":vertical resize -2<CR>")
remap("n", "<C-Right>", ":vertical resize +2<CR>")

-- Resize with alt
remap("n", "<A-h>", ":vertical resize -2<CR>")
remap("n", "<A-l>", ":vertical resize +2<CR>")

-- Navigate buffers
remap("n", "<S-l>", ":bnext<CR>")
remap("n", "<S-h>", ":bprevious<CR>")
remap("n", "<C-w>", ":Bdelete<CR>")

-- Move text up and down
remap("n", "<A-j>", ":m .+1<CR>==")
remap("n", "<A-k>", ":m .-2<CR>==")

-- Insert
-- Press jk to exit insert mode
remap("i", "jk", "<ESC>")

-- Visual --
-- Stay in indent mode
remap("v", "<", "<gv")
remap("v", ">", ">gv")

-- Move text up and down
remap("v", "<A-j>", ":m .+1<CR>==")
remap("v", "<A-k>", ":m .-2<CR>==")

-- Pasting with word replacing, don't save replaced word to "pasting" buffer
remap("v", "p", '"_dP')

-- Visual Block --
-- Move text up and down
remap("x", "J", ":move '>+1<CR>gv-gv")
remap("x", "K", ":move '<-2<CR>gv-gv")
remap("x", "<A-j>", ":move '>+1<CR>gv-gv")
remap("x", "<A-k>", ":move '<-2<CR>gv-gv")
