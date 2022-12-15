local ok, packer = pcall(require, "packer")
if not ok then
    vim.notify("Packer not found")
    return
end

-- Make packer use popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({border = "rounded"})
        end,
    },
})

return packer.startup(function(use)
    -- Plugin manager itself
    use("wbthomason/packer.nvim")

    -- Utils functions used by other plugins
    use("nvim-lua/plenary.nvim")

    -- Colorscheme
    use("Mofiqul/vscode.nvim")

    -- Language Server Protocol
    use("neovim/nvim-lspconfig")

    -- Completion
    use({
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
    })
    -- Completion Icons
    use("onsails/lspkind.nvim")

    -- Code highlighting
    use("nvim-treesitter/nvim-treesitter")

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = {{"nvim-lua/plenary.nvim"}}
    })

    -- Git Signs
    use("lewis6991/gitsigns.nvim")

    -- Indentation line
    use({
        "lukas-reineke/indent-blankline.nvim",
        requires = {{
            "nvim-treesitter/nvim-treesitter",
            opt = true,
        }},
    })

    use("windwp/nvim-autopairs")
end)
