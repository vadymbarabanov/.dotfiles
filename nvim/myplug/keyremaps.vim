inoremap jk <esc>

"save all
noremap  <c-s> :wa<cr>
inoremap <c-s> <esc>:wa<cr>

"remove current buffer
noremap <c-w> :bd<cr>

"remove all buffers
noremap <c-q> :qa<cr>

"better indenting
vnoremap > >gv
vnoremap < <gv

"moving between windows
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-h> <c-w>h
map <c-l> <c-w>l

"fzf
nnoremap <silent> <c-p> :GFiles<cr>
nnoremap <silent> <c-b> :Buffers<cr>
nnoremap <silent> <c-f> :Rg<cr>

"substitution snippet
noremap S :%s//gc<left><left><left>

"window resizing
nnoremap <silent><a-h> :vertical resize -10<CR>
nnoremap <silent><a-l> :vertical resize +10<CR>
nnoremap <silent><a-j> :resize -5<CR>
nnoremap <silent><a-k> :resize +5<CR>
