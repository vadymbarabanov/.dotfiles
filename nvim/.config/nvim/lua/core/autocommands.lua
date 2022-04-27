local logger = require("utils.logger")

-- autocmd! remove all autocommands, if entered under a group it will clear that group
vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end
]])

-- NVIM 0.7.0 section
local function set_nvim7_features()
	if vim.version().minor ~= 7 then
		return
	end

	logger.info("0.7.x version of neovim detected. Setting up new features...")

	local augroup = vim.api.nvim_create_augroup
	local autocmd = vim.api.nvim_create_autocmd

	-- Remove whitespace on save
	autocmd("BufWritePre", {
		pattern = "*",
		command = ":%s/\\s\\+$//e",
	})

	-- Highlight on yank
	augroup("YankHighlight", { clear = true })
	autocmd("TextYankPost", {
		group = "YankHighlight",
		callback = function()
			vim.highlight.on_yank({ higroup = "Search", timeout = "200" })
		end,
	})

	-- Set global status line
	vim.opt.laststatus = 3
	vim.cmd([[
    highlight WinSeparator guibg=None
  ]])
end

set_nvim7_features()
