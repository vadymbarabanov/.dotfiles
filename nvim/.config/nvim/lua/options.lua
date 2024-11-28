local options = {
    cursorline = true,

    number = true,
    numberwidth = 2,
    signcolumn = "yes",

    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,
    smartindent = true,

    hlsearch = false,
    incsearch = true,
    ignorecase = true,
    smartcase = true,

    wrap = false,
    clipboard = "unnamed",

    splitbelow = true,
    splitright = true,

    laststatus = 3,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

-- Global status line
vim.cmd("highlight WinSeparator guibg=None")

