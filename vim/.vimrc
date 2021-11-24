"  ---------------------------------------------------------------
"  >> set command <<
"  ---------------------------------------------------------------
" common settings
set showcmd
"set showmatch       " show matching brackets.
set ignorecase
set smartcase
"set autowrite       " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all mouse)

" hightlight search
set hlsearch
set incsearch

"pattern's highlight(hl) color
highlight Search ctermbg=gray ctermfg=red
"highlight IncSearch ctermbg=black ctermfg=yellow
"highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE

" show number
set nu
"set rnu
"set relativenumber

" delay the atuo " and the #
set fo-=o
set fo-=r
set fo-=c

" c/c++ indent
au BufRead,BufNewFile *.cpp,*.c,*.h,*.hpp set cindent

" tab key
"set autoindent " start the newline and will deal the indent
set smartindent
set expandtab  " expand the tab key as the space
set tabstop=4  " key one time tab, indent 4 space
set shiftwidth=4 " if auto indent, will indent 4 space
set backspace=2 " key one <-, delet 2 space

" about the <leader>key's timeout
set timeout timeoutlen=1000 "timeout + timeoutlen

" cursor
set cursorline
set cursorlineopt=number
"set cursorlineopt=both " number + screenline
"highlight CursorLine term=NONE ctermbg=black

" bg, term's color bits
set background=dark
set t_Co=256

" encoding 
set fencs=utf-8,big5,gb18030,utf-16

" fold setting
set foldmethod=marker "{{{}}} as the fold marker
"set foldmethod=syntax

" show space, tab, newline, end_of_line
"set listchars=tab:\|\ 
"set listchars=tab:\┊\ 
""set listchars=tab:\┆\ 
"set listchars=tab:\¦\ 
"set list
set listchars+=tab:\|\
set listchars+=space:.

" status and ruler
"set statusline=\PATH:\ %r%F\ \ \ \ \LINE:\ %l/%L/%P\ TIME:\ %{strftime('%c')}
set ruler
"set rulerformat=%55(%{strftime('%F\ %H:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set rulerformat=%36(%{strftime('%F\ %H:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
" set the isfilename to get ride of the = character;
set isfname=@,48-57,/,.,-,_,+,,,#,$,%,~

"  ---------------------------------------------------------------
"  cursor's shape and the color
"  ---------------------------------------------------------------
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q\e]12;orange\a\2"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"  ---------------------------------------------------------------
"  **********************abou the command set**********
"  ---------------------------------------------------------------
:command W w
"  ---------------------------------------------------------------
"  ********************** the test setting (provisonal) **********
"  ---------------------------------------------------------------
au BufWritePre *.html :normal gg=G
" you can serach" < How can I emulate key press on Vim startup? > " in the
" google
"funciton: when you open the file, press the zz automatically in the vim, that is very useful
"au BufRead *.goal :execute "normal zz" 
"au BufRead *.txt :execute "normal z\<Cr>"
au BufRead,BufNewFile *.txt,*.goal,*.pratice :execute "normal zz\<Cr>"
"--------------------------------------------------------------------------------
" Automatically open the quickfix window on: make
"--------------------------------------------------------------------------------
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
"autocmd QuickFixCmdPost [^l]* nested copen "always open the quickfix
autocmd QuickFixCmdPost    l* nested lwindow
"
"--------------------------------------------------------------------------------
" underline, overline, and the strikeout line
"--------------------------------------------------------------------------------
" EXPLANATION:
" reference to the url:
" https://vim.fandom.com/wiki/Create_underlines,_overlines,_and_strikethroughs_using_combining_characters
" usage: :Overline;  or the :Underline  or the :DoubleUnderline or the
" Strikethrough
"--------------------------------------------------------------------------------
" modify selected text using combining diacritics
command! -range -nargs=0 Overline        call s:CombineSelection(<line1>, <line2>, '0305')
command! -range -nargs=0 Underline       call s:CombineSelection(<line1>, <line2>, '0332')
command! -range -nargs=0 DoubleUnderline call s:CombineSelection(<line1>, <line2>, '0333')
command! -range -nargs=0 Strikethrough   call s:CombineSelection(<line1>, <line2>, '0336')
function! s:CombineSelection(line1, line2, cp)
  execute 'let char = "\u'.a:cp.'"'
  execute a:line1.','.a:line2.'s/\%V[^[:cntrl:]]/&'.char.'/ge'
endfunction

"-----------------------------------------------------------------------------------------
" source my own function
source ~/.vim/hgj-vim-config/func.vim
source ~/.vim/hgj-vim-config/map.vim
source ~/.vim/hgj-vim-config/plugin-setting.vim
" new test by hgj
