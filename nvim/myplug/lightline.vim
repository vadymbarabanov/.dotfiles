" LIGHTLINE
let g:lightline#bufferline#enable_devicons=1
let g:lightline = {
    \ 'colorscheme': 'onedark',
    \ 'active': {
        \ 'left': [
            \ [ 'mode', 'paste' ],
            \ [ 'fugitive', 'readonly', 'filename',  'modified' , 'filetype' ]
        \ ],
        \ 'right': [
            \ [ 'lineinfo' ],
            \ [ 'percent' ],
            \ [ 'fileformat', 'fileencoding']
        \ ]
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
