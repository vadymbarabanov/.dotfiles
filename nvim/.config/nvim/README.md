# Minimal [Neovim](https://neovim.io/) configuration written in [Lua](https://www.lua.org/)

## Functional Features

### Plugin Manager

[Packer](https://github.com/wbthomason/packer.nvim) - manage (install, remove etc.) plugins.

### Fuzzy finder

[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) - searching for files, buffers etc.

Make sure you have installed required utils by running `:checkhealth telescope`

### Language Server Protocol

[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - add intelligence to the text editor, show errors, warnings etc.

Make sure you have installed and setup prefered language servers inside `./after/plugin/lsp.nvim` file.

### Code completion

[hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - while typing show window under the cursor with available completions. Paired with nvim-lspconfig provide useful language server protol related completions.

## Visual Features

### Code highlighting

[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - better code highlighting

Make sure you have added prefered languages inside `./after/plugin/treesitter.nvim` file.

### Git Signs

[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) - indicates git changes by line a la vscode

