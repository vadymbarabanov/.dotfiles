"============================ PLUGINS IMPORT =================================="

call plug#begin('~/.config/nvim/plugged')

" Colorschemes
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'folke/tokyonight.nvim'

" Visual plugins
Plug 'itchyny/lightline.vim'
Plug 'lilydjwg/colorizer'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

" Functional plugins
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'

call plug#end()

"=============================================================================="

"========================= PLUGINS CONFIGURATION =============================="

" COC
source ~/.config/nvim/myplug/coc.vim

" FZF
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --theme=TwoDark --color=always --style=header,grid --line-range :300 {}'"
nnoremap <silent> <c-p> :Files<CR>
nnoremap <silent> <c-b> :Buffers<CR>
" search inside files
nnoremap <silent> <c-f> :Rg<CR>

" NERDTree
source ~/.config/nvim/myplug/nerdtree.vim

" INDENTLINE
" let g:indentLine_char = ''
let g:indentLine_char = '▏'
autocmd FileType markdown,json let g:indentLine_enabled=0

" COLORSCHEME
set background=dark
let g:onedark_hide_endofbuffer = 1
let g:onedark_terminal_italics = 1
try | colorscheme onedark | catch | endtry

" fix popup color so it's easier to read
hi CocErrorSign ctermbg=red guibg=#AE0700 ctermfg=white guifg=#E9E0C9

" LIGHTLINE
source ~/.config/nvim/myplug/lightline.vim

"=============================================================================="

" Default "SET" configuration
source ~/.config/nvim/myplug/setconf.vim

"============================= AUTO EXECUTION ================================="

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e

" Spellcheck
autocmd FileType tex,latex,markdown,gitcommit setlocal spell spelllang=en_us

" disable auto commeting on new line
autocmd filetype * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" restore last line position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
    \ | exe "normal! g`\"" | endif

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
nmap <leader><tab> <c-^>
nmap <leader>wa <c-w>v:A<CR>

noremap  S :%s//gc<Left><Left><Left>

" Resizing
nnoremap <silent><a-h> :vertical resize -10<CR>
nnoremap <silent><a-l> :vertical resize +10<CR>
nnoremap <silent><a-j> :resize -5<CR>
nnoremap <silent><a-k> :resize +5<CR>

" Better indenting
vnoremap > >gv
vnoremap < <gv

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

let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>

"=============================================================================="
