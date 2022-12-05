local options = {
    guicursor = "",
    cursorline = true,

    number = true,
    numberwidth = 2,

    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4,
    expandtab = true,

    hlsearch = false,
    incsearch = true,
    ignorecase = true,
    smartcase = true,

    smartindent = true,

    wrap = false,

    splitbelow = true,
    splitright = true,

    laststatus = 3,

    background = "dark",

    showmode = false,
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

-- Parse "some-thing" as one word
vim.opt.iskeyword:append("-")

