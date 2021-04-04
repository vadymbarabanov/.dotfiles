let g:coc_global_extensions = [
    \ 'coc-emmet',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-prettier',
    \ 'coc-snippets',
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

" Organize imports
nnoremap <leader>oi :call CocAction('runCommand', 'tsserver.organizeImports')<CR>

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
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>

nmap <silent><space>rn <Plug>(coc-rename)
nmap <silent><space>do <Plug>(coc-codeaction)
nmap <silent><space>qf <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> E :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Rescan the entire buffer when highlighting
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
