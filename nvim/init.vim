"============================ PLUGINS IMPORT =================================="

call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'

" Visual plugins
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'lilydjwg/colorizer'

" Functional plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

call plug#end()

"=============================================================================="

"=============================== COC CONFIGURATION ============================"

let g:coc_global_extensions = [
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-prettier',
    \ 'coc-react-refactor',
    \ 'coc-tsserver',
    \ ]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Allow to use Tab and Enter for auto import
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Check if the backspace was pressed
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Organize imports & call Prettier
nnoremap <space>o :call CocAction('runCommand', 'tsserver.organizeImports')<CR>

" Prettier
nnoremap <leader>p :Prettier <CR>
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" 'Go to' code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Jumping between errors
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Open diagnostic list
nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>

" List of workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>

nmap <space>rn <Plug>(coc-rename)
nmap <space>do <Plug>(coc-codeaction)
nmap <space>qf <Plug>(coc-fix-current)

" Make <c-space> auto-select the first completion item and notify coc.nvim to
inoremap <silent><expr> <c-space> pumvisible() ? coc#_select_confirm()
    \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window.
nnoremap <silent> E :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" REACT-REFACTOR
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Rescan the entire buffer when highlighting
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear

"=============================================================================="

"========================= PLUGINS CONFIGURATION =============================="

" FZF
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-g> :Buffers<CR>
" search inside files
nnoremap <silent> <Leader>f :Rg<CR>

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 31
let g:NERDTreeIgnore = ['^node_modules$', '^dist$']
let g:NERDTreeStatusline = ''
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeBookmarksFile = '~/.cache/NERDTree/.NERDTreeBookmarksFile'

" Toggle NERDTree
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree()) | q | endif

" Automaticaly open NERDTree when arguments: !files | directory
function! StartUp()
    if !argc() && !exists("s:std_in")
        NERDTree
    end
    if argc() && isdirectory(argv()[0]) && !exists("s:std_in")
        exe 'NERDTree' argv()[0]
        wincmd p
        ene
    end
endfunction
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * call StartUp()

" INDENTLINE
let g:indentLine_char = ''
autocmd FileType markdown,json,vim let g:indentLine_enabled=0

" COLORSCHEME
" let ayucolor="mirage"
" let g:gruvbox_invert_selection=0
colorscheme onedark

" LIGHTLINE
let g:lightline#bufferline#enable_devicons=1
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat',  'filetype', 'fileencoding'] ]
    \ },
    \ 'component': {
        \ 'modified': '%M',
    \ },
	\ 'component_function': {
        \ 'fugitive': 'LightlineFugitive',
        \ 'readonly': 'LightlineReadonly',
        \ 'filename': "LightlineFilename",
        \ 'filetype': 'FileTypeIcon',
        \ 'fileformat': 'FileFormatIcon',
        \ 'fileencoding': 'LightlineFileencoding',
	\ },
    \ 'tab_component_function': {
        \   'tabnum': 'LightlineWebDevIcons',
    \ },
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
    \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
	\ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ &filetype ==# 'nerdtree' ? '' :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! FileTypeIcon()
    return winwidth(0) > 70 ? (strlen(&filetype) ?
                \ WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! FileFormatIcon()
    return winwidth(0) > 70 ? (WebDevIconsGetFileFormatSymbol()) : ''
endfunction

function! LightlineWebDevIcons(n)
  let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
  return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! LightlineReadonly()
	return &readonly ? '' : ''
endfunction

function! LightlineFugitive()
	if exists('*FugitiveHead')
		let branch = FugitiveHead()
		return &filetype ==# 'nerdtree' ? '' : branch !=# '' ? ''.branch : ''
	endif
	return ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fileencoding !=# '' ? &fileencoding : '') : ''
endfunction

"=============================================================================="

"============================ DEFAULT CONFIGURATION ==========================="

let mapleader=" "
set termguicolors
set guifont=FiraCode\ Nerd\ Font\ Mono:h12

set spelllang=en,ru

set colorcolumn=81
set cursorline
set noshowmode
set number
set showcmd
set cmdheight=2

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
set noerrorbells
set novisualbell
set updatetime=50                 " default is 4000, bad for diagnostic
set history=1000
set undolevels=1000
set wildmenu                      " set file find completion menu
set shortmess+=c                  " Don't give /ins-completion-menu/ messages
set signcolumn=yes                " left side line to off moving while linting

set tabstop=4                     " set tab = 4 spaces
set shiftwidth=4
set expandtab
set autoindent

set nohlsearch                    " Disable highlighting after search
set incsearch
set ignorecase
set smartcase
set showmatch

" Spellcheck for markdown
au BufRead,BufNewFile *.md setlocal spell

" disable auto commeting on new line
autocmd filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"=============================================================================="

"============================ KEY REMAPING ===================================="

" reload configuration
map <silent><leader>s :source $MYVIMRC<cr><bar> :echo "Config Updated!"<cr>

" Ctrl+s to save all
noremap  <c-s> :wa<cr>
inoremap <c-s> <esc>:wa<cr>
" Ctrl+q to quit current buffer
noremap  <c-q> :q<cr>
inoremap <c-q> <esc> :q<cr>

" Resizing
nnoremap <silent><a-h> :vertical resize -10<CR>
nnoremap <silent><a-l> :vertical resize +10<CR>
nnoremap <silent><a-j> :resize -5<CR>
nnoremap <silent><a-k> :resize +5<CR>

" moving between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

" Toggle wrap
noremap <silent><leader>w :call ToggleWrap()<cr>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        setlocal display+=lastline
    endif
endfunction

" Toggle colorcolumn
noremap <silent><leader>cc :call ToggleColorcolumn()<cr>
function ToggleColorcolumn()
    if &colorcolumn
        setlocal colorcolumn=0
    else
        setlocal colorcolumn=81
    endif
endfunction

"=============================================================================="

"============================= AUTO EXECUTION ================================="

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Recompile dwmblocks on config edit.
autocmd BufWritePost ~/.local/src/dwmblocks/config.h !cd ~/.local/src/dwmblocks/; sudo make install && { killall -q dwmblocks;setsid -f dwmblocks }

" auto sass/scss compiling
autocmd bufwritepost [^_]*.sass,[^_]*.scss  silent exec "!sass %:p %:r.css"

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

"=============================================================================="
