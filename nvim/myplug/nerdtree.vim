" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeWinSize = 31
let g:NERDTreeIgnore = ['^node_modules$', '^dist$', '^.git$']
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
" function! StartUp()
"     if !argc() && !exists("s:std_in")
"         NERDTree
"     end
"     if argc() && isdirectory(argv()[0]) && !exists("s:std_in")
"         exe 'NERDTree' argv()[0]
"         wincmd p
"         ene
"     end
" endfunction
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * call StartUp()
