":command W w
"
" you can serach" < How can I emulate key press on Vim startup? > " in the  google
"funciton: when you open the file, press the zz automatically in the vim, that is very useful
"au BufRead *.goal :execute "normal zz" 
"au BufRead *.txt :execute "normal z\<Cr>"
au BufRead,BufNewFile *.txt,*.goal,*.pratice :execute "normal zz\<Cr>"

" the insert mode's abbreviation
" iab ciw <esc>ciw " not the good idea
"

function! CheckTerminalSize()
	exec "normal \<C-w>="
endfunction

"autocmd WinResized * call CheckTerminalSize()

