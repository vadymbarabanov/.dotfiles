return {
    "echasnovski/mini.completion",
    version = false,
    config = function()
        require("mini.completion").setup({
            delay = {
                completion = 200,
                info = 100,
                signature = 50,
            },
        })
        vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })
        vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
    end
}

