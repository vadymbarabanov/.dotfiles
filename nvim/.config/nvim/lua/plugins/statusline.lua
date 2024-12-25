local config = {
    options = {
        component_separators = "",
        section_separators = "",
        always_divide_middle = true,
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_sectinos = {
        lualine_a = {"filename"},
        lualine_b = {"location"},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
}

local function status_c(component)
    table.insert(config.sections.lualine_c, component)
end

local function status_x(component)
    table.insert(config.sections.lualine_x, component)
end

-- left
status_c({
    "filename",
    cond = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
    end,
    path = 0,
    symbols = {
        modified = "+",
        readonly = "[readonly]",
        unnamed = "[no name]",
        newfile = "[new],"
    },
})

-- mid
status_c({ function() return "%=" end })

-- right
status_x({
    "diff",
    cond = function()
        local filepath = vim.fn.expand("%:p:h")
        local gitdir = vim.fn.finddir(".git", filepath..";")
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
    source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
            return {
                added = gitsigns.added,
                modified = gitsigns.changed,
                removed = gitsigns.removed,
            }
        end
    end,
    symbols = {
        added = "+",
        modified = "~",
        removed = "-",
    },
    colored = true,
})

status_x({
    "diagnostics",
    sources = { "nvim_lsp" },
    symbols = {
        error = "errors ",
        warn = "warnings ",
        info = "infos ",
        hint = "hints ",
    },
})

status_x({ "branch" })

return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup(config)
    end,
}
