" ---------------------------------------------------------------
" plugin setting
" ---------------------------------------------------------------
"
" ^---------- vim-plug ----------$
call plug#begin('~/.vim/plugged')
" github
" easymotion, goyo, limelight, mathjax-support-for-mkdp, nerdtree, python-vim-instant-markdown,
" taglist, unicode, vim-exchange, vim-latex-live-preview, vim-numbertoggle, vim-table-mode,
" easy-rich-text, txtfmt,
" surround, unimpaired, vim-obsession
Plug 'junegunn/vim-easy-align'
Plug 'pechorin/any-jump.vim'
Plug 'easymotion/vim-easymotion'
Plug 'bpstahlman/txtfmt'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tommcdo/vim-exchange'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'chrisbra/unicode.vim'
Plug 'vim-scripts/taglist.vim', {'on': 'NOTLOAD'}
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'preservim/nerdtree'
"Plug 'isnowfy/python-vim-instant-markdown'
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
Plug 'ycm-core/YouCompleteMe'

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
" ^---------- Youcompleteme ----------$
nmap <leader>yfw <Plug><YCMFindSymbolInWorkspace>
nmap <leader>yfd <Plug><YCMFindSymbolInDocument>
nmap <leader>jd :YcmCompleter GoToDefinition<CR>
"
" ^---------- plugin_name ----------$
"
