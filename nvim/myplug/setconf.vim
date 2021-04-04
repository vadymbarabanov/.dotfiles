let mapleader=" "                 " set leader key to space
nnoremap <space> <nop>

set termguicolors
set guifont=FiraCode\ Nerd\ Font\ Mono:h12

set colorcolumn=81
set cursorline
set noshowmode
set number
set showcmd
set cmdheight=2
set noerrorbells
set novisualbell
set wildmenu                      " set file find completion menu
set shortmess+=c                  " don't give /ins-completion-menu/ messages
set signcolumn=yes                " left-side line to off moving while linting
set notimeout                     " disable timeout for finishing a mapping key sequence

set nobackup                      " some server have issues with backup files
set noswapfile
set nowritebackup

set linebreak                     " avoid wrapping line in the middle of a word
set scrolloff=8
set sidescrolloff=5
set display+=lastline
set ssop-=options                 " don't store global & local values in session
set ssop-=folds                   " do not store folds
set clipboard+=unnamedplus        " allow copy&paste from clipboard
set backspace=indent,eol,start
set mouse=a                       " enable mouse
set mousehide
set hidden                        " when close a tab, remove the buffer
set splitbelow splitright         " new splits appear below and right
set nowrap
set matchpairs+=<:>               " add <,> to jump between using %
set lazyredraw
set updatetime=50                 " default is 4000, bad for diagnostic
set history=1000
set undolevels=1000

set expandtab                     " convert tabs into spaces
set tabstop=4                     " show tabs as 4 spaces
set shiftwidth=4                  " number of spaces to use for indenting
set autoindent                    " copy indent from previous line

set nohlsearch                    " disable highlighting after search
set incsearch
set ignorecase smartcase          " case-insensitive until capital letter
set showmatch

set spelllang=en,ru

if has("nvim")
  set inccommand=nosplit          " show substitutions incrementally
endif
