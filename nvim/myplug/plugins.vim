call plug#begin('~/.config/nvim/plugged')

Plug 'joshdick/onedark.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescriptreact'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescriptreact' }
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascriptreact']}
Plug 'maxmellon/vim-jsx-pretty', { 'for': 'javascriptreact' }

call plug#end()

