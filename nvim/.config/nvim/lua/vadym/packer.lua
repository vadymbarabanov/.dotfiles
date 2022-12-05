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
    use("wbthomason/packer.nvim") -- plugin manager itself
    use("nvim-lua/plenary.nvim") -- useful funcs used by many plugins

    use("Mofiqul/vscode.nvim") -- colorscheme

    -- Lsp
    use("neovim/nvim-lspconfig")
    use("onsails/lspkind.nvim")

    use("nvim-treesitter/nvim-treesitter")
    use({
        "lukas-reineke/indent-blankline.nvim",
        requires = {{"nvim-treesitter/nvim-treesitter", opt = true}}
    })
    use("windwp/nvim-autopairs")

    use({
        'nvim-telescope/telescope.nvim', branch = '0.1.x',
        -- `:checkhealth telescope` to check utilities telescope requires
        requires = {{'nvim-lua/plenary.nvim'}}
    })

    -- testing
        -- Completion
        use("hrsh7th/nvim-cmp")
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-buffer")
    -- testing
        -- Git
        use("lewis6991/gitsigns.nvim")
        use("dinhhuy258/git.nvim")
    -- testing
        use("norcalli/nvim-colorizer.lua")
end)