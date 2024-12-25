return {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    init = function()
        local hours = tonumber(vim.fn.strftime("%H"))

        if hours > 7 and hours < 17 then
            vim.cmd.colorscheme("onelight")
        else
            vim.cmd.colorscheme("onedark")
        end
    end,
}

