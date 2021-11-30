"restore last line position when opening file
autocmd BufReadPost * restorePosition()

function restorePosition()
	if line("'\"") > 1 && line("'\"")  <= line ("$")
		exe "normal! g`\""
	endif
endfunction

"delete empty space from the end of lines on every save
autocmd BufWritePre * :%s/\s\+$//e
