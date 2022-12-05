local ok, tsc = pcall(require,"telescope")
if not ok then
    vim.notify("telescope not found")
    return
end

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<C-f>", builtin.live_grep, {})
vim.keymap.set("n", "<C-b>", builtin.buffers, {})

tsc.setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        },
        layout_strategy = "vertical",
        layout_config = {
            vertical = {width = 0.5},
        },
    }
})
