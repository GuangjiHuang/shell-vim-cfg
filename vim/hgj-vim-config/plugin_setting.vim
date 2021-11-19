" ---------------------------------------------------------------
" plugin setting
" ---------------------------------------------------------------
"
" ^---------- vim-plug ----------$
call plug#begin('~/.vim/plugged')
" github
Plug 'git://github.com/junegunn/vim-easy-align'
Plug 'git://github.com/pechorin/any-jump.vim'
" local
Plug '~/.vim/plugged/command-t', {'on' : 'Activatecommand'}
Plug '~/.vim/plugged/vim-instant-markdown', {'for' : 'markdown'}
Plug '~/.vim/plugged/vim-fugitive'
Plug '~/.vim/plugged/vinegar', {'on' : 'Onvinegar'}
call plug#end()
"
" ^---------- easymotion ----------$
"
map g<space> <Plug>(easymotion-prefix)
map gh <Plug>(easymotion-prefix)
"
" ^---------- markdown ----------$
"
" the markdown-vim setting
let g:vim_markdown_folding_disable = 1
" set header floding level
let g:vim_markdown_folding_level = 6 "the value can be the 1 to 6
" about the conceal
"set conceallevel=2
"
" ^---------- txtfmt ----------$
" 
"  to slove the map ambiguity, to use the default instead of the txtfmt
"  this may be very important
let g:txtfmtMapwarn = 'c'
"about the ft(filetype) based on the file's extension, such as the *.cpp, *.py, and so on 
au BufRead,BufNewFile *.goal,*.txt,*.ddl set nocindent
au BufRead,BufNewFile *.goal,[^C]*.txt,*.ddl set ft=txtfmt
"
" ^---------- Goyo ----------$
"
" slove the problem that leave the goyo will change the colortheme
"autocmd! User GoyoLeave source $HOME/.vimrc
"autocmd! User GoyoEnter source $HOME/.vimrc
augroup goyo_control
    autocmd!
    au User GoyoLeave set bg=dark "the problem that change the colorscheme
    au User GoyoEnter set number
    au User GoyoEnter :so /home/hgj/.vim/pack/others/start/vim-numbertoggle/plugin/number_toggle.vim "the problem that numberline
augroup END
"
" ^---------- limelight ----------$
"
let g:limelight_conceal_ctermfg = 0
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
"
" ^---------- NERDTREE ----------$
:command T Ntree
:command NT NERDTree
"
" ^---------- plugin_name ----------$
"
" ^---------- plugin_name ----------$
"
