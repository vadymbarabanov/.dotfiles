source $HOME/.config/nvim/myplug/plugins.vim
source $HOME/.config/nvim/myplug/lightline.vim
source $HOME/.config/nvim/myplug/keyremaps.vim
source $HOME/.config/nvim/myplug/autocmd.vim

colorscheme delek

set number
set mouse=a
set mousehide
set clipboard=unnamed,unnamedplus
set matchpairs+=<:>
set linebreak
set nowrap

set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set hlsearch
set incsearch
set ignorecase smartcase
set showmatch

set splitbelow splitright

set updatetime=50
set lazyredraw

set noerrorbells
set novisualbell

set backspace=indent,eol,start

if has("nvim")
  set inccommand=nosplit          "show substitutions incrementally
endif

"========================= PLUGINS CONFIGURATION =============================="

let g:indentLine_char = '▏'

