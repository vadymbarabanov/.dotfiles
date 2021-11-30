let g:lightline = { 
\  'colorscheme': 'one',
\
\  'active': {
\    'left': [
\      [ 'mode', 'paste' ],
\      [ 'gitbranch', 'readonly', 'filename', 'modified' ] 
\     ]
\  },
\
\  'component_function': {
\    'gitbranch': 'FugitiveHead',
\    'fileformat': 'Fileformat',
\    'filetype': 'Filetype',
\  },
\
\  'mode_map': {
\    'n' : 'N',
\    'i' : 'I',
\    'R' : 'R',
\    'v' : 'V',
\    'V' : 'VL',
\    "\<C-v>": 'VB',
\    'c' : 'C',
\    's' : 'S',
\    'S' : 'SL',
\    "\<C-s>": 'SB',
\    't': 'T',
\  },
\  }

"\  'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
"\  'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },

function! IsNarrow()
    return winwidth(0) > 70
endfunction

"remove file format on narrow windows
function! Fileformat()
  return IsNarrow() ? &fileformat : ''
endfunction 

"remove file type on narrow windows
function! Filetype()
  return IsNarrow() ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction
