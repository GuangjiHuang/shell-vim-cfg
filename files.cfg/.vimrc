"  ---------------------------------------------------------------
"  **********************set my own variable in the vim **********
"  ---------------------------------------------------------------
"  let vim_s=$HOME/
"  ---------------------------------------------------------------
"  **********************  Maping the key ************************
"  ---------------------------------------------------------------
" the jj -> esc 
inoremap jj <esc>
"about the jump to the window quickly
nnoremap gw <c-w>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
"about the buffer
nnoremap [b :bp<Enter>  " the last one
nnoremap ]b :bn<Enter>  " the next one
nnoremap [1 :b1<Enter>  " b1
nnoremap [2 :b2<Enter>  " b2
nnoremap [3 :b3<Enter>  " b3
nnoremap [4 :b4<Enter>  " b4
nnoremap [5 :b5<Enter>  " b5
"
"  ---------------------------------------------------------------
"  **********************   the set comand ************************
"  ---------------------------------------------------------------
"  the most common
set showcmd         " show partial command in status line
"set showmatch       " show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
"set autowrite       " Automatically save before commands like :next and :make
set hidden          " Hide buffers when they are abandoned
set mouse=a         " Enable mouse usage (all mouse)

" about the highlight search
set hlsearch
set incsearch

"set the search pattern's highlight color
highlight Search ctermbg=gray ctermfg=red
"highlight IncSearch ctermbg=black ctermfg=yellow
"highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE

" show the number
set nu

" delay the atuo " and the #
set fo-=o
set fo-=r
set fo-=c

"set the c programer 
set cindent

" about the tab key
"set autoindent " start the newline and will deal the indent
set smartindent
set expandtab  " expand the tab key as the space
set tabstop=4  " key one time tab, indent 4 space
set shiftwidth=4 " if auto indent, will indent 4 space
set backspace=2 " key one <-, delet 2 space

" about the <leader>key's timeout(you have to set timeout on first, and then
" set the ms of the timeout, and the default timeoutlen is the 1000ms  
set timeout timeoutlen=1000

" about the cursor and the curosr line
set cursorline
set cursorlineopt=number
"set cursorlineopt=both " if the value is both, means the number and the
"screenline

"highlight CursorLine term=NONE ctermbg=black

set background=dark
set t_Co=256

"about the file's encoding
set fencs=utf-8,big5,gb18030,utf-16

"about the fold in the file
set foldmethod=marker "will creat the {{{}}} as the fold marker

"about show the space, tab and the efl
"set listchars=tab:\|\ 
"set listchars=tab:\┊\ 
""set listchars=tab:\┆\ 
"set listchars=tab:\¦\ 
"set list
set listchars+=tab:\|\
set listchars+=space:.

" set the status
"set statusline=\PATH:\ %r%F\ \ \ \ \LINE:\ %l/%L/%P\ TIME:\ %{strftime('%c')}
set ruler
"set rulerformat=%55(%{strftime('%F\ %H:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
set rulerformat=%36(%{strftime('%F\ %H:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)

"  ---------------------------------------------------------------
"  ********************** cursor's shape and the color **********
"  ---------------------------------------------------------------
" ## change the shape of the cursor in different mode
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
"  ********************** about the plugin setting **********
"  ---------------------------------------------------------------
map g<space> <Plug>(easymotion-prefix)
map gh <Plug>(easymotion-prefix)
" the markdown-vim setting
let g:vim_markdown_folding_disable = 1
" set header floding level
let g:vim_markdown_folding_level = 6 "the value can be the 1 to 6
" about the conceal
"set conceallevel=2
"  ---------------------------------------------------------------
"  ********************** about the Vundle's setting  **********
"  -------------------------------------------------
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
"Plugin 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
"Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'iamcco/markdown-preview.vim'
"Plugin 'instant-markdown/vim-instant-markdown'
Plugin 'file:///home/hgj/.vim/bundle/vim-instant-markdown'
" add the vim-markdown-composer(github.com/ecuclio/vim-markdown-composer)
"Plugin 'euclio/vim-markdown-composer'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line--------------
"
"  ---------------------------------------------------------------
"  **********************about the markdown_preview setting
"  ---------------------------------------------------------------

"  ---------------------------------------------------------------
"  **********************about the txtfmt setting
"  ---------------------------------------------------------------
"  to slove the map ambiguity, to use the default instead of the txtfmt
"  this may be very important
let g:txtfmtMapwarn = 'c'
"about the ft(filetype) based on the file's extension, such as the *.cpp, *.py, and so on 
au BufRead,BufNewFile *.goal,*.txt,*.ddl set nocindent
au BufRead,BufNewFile *.goal,*.txt,*.ddl set ft=txtfmt

"  ---------------------------------------------------------------
"  **********************about the Goyo setting
"  ---------------------------------------------------------------
" slove the problem that leave the goyo will change the colortheme
"autocmd! User GoyoLeave source $HOME/.vimrc
"autocmd! User GoyoEnter source $HOME/.vimrc
augroup goyo_control
    autocmd!
    au User GoyoLeave set bg=dark "the problem that change the colorscheme
    au User GoyoEnter set number
    au User GoyoEnter :so /home/hgj/.vim/pack/others/start/vim-numbertoggle/plugin/number_toggle.vim "the problem that numberline
augroup END

nnoremap <leader>f :Goyo 60%x100%<Cr>
" <<< bug generate >>>
"autocmd VimResized * source $HOME/.vimrc
"
" to solve the problem of the Goyo <https://github.com/junegunn/goyo.vim/issues/42>
" << Fail to slove the problem >>
" the colortheme and the line number
" augroup goyo
"   autocmd!
"   autocmd VimResized * source $HOME/.vimrc
"    autocmd BufWinLeave <buffer> call s:goyo_off()
"    autocmd TabLeave    *        call s:goyo_off()
"    autocmd VimResized  *        call s:resize_pads()
"    autocmd ColorScheme *        call s:tranquilize()
"    autocmd InsertEnter * :set nonumber
"    autocmd InsertLeave * :set norelativenumber
" augroup END

"  ---------------------------------------------------------------
"  **********************about the limelight setting
"  ---------------------------------------------------------------
let g:limelight_conceal_ctermfg = 0
nnoremap <leader>l :Limelight!!<Cr>
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!


"  ---------------------------------------------------------------
"  **********************abou the command set**********
"  ---------------------------------------------------------------
"
:command W w
:command T Ntree
:command NT NERDTree
"  ---------------------------------------------------------------
"  ********************** the test setting (provisonal) **********
"  ---------------------------------------------------------------
au BufWritePre *.html :normal gg=G
au FileType cpp,c nnoremap <buffer> <localleader>c I//<esc>
au FileType python nnoremap <buffer> <localleader>c I#<esc>
" you can serach" < How can I emulate key press on Vim startup? > " in the
" google
"funciton: when you open the file, press the zz automatically in the vim, that is very useful
"au BufRead *.goal :execute "normal zz" 
"au BufRead *.txt :execute "normal z\<Cr>"
au BufRead,BufNewFile *.txt,*.goal,*.pratice :execute "normal Gz\<Cr>"
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
"nnoremap <leader>m :silent make %\|redraw!cw<CR>
nnoremap <leader>m :make %<CR>
set makeprg=g++
"nnoremap <leader>m :!g++ -o %< %<enter><CR>
