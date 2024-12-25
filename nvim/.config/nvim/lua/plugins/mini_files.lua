return {
    "echasnovski/mini.files",
    version = false,
    config = function()
        local files = require("mini.files")
        files.setup()
        vim.keymap.set("n", "<leader>t", files.open, {})
    end,
}
