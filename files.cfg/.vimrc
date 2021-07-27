"  HERE is the custom
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
Plugin 'instant-markdown/vim-instant-markdown'

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
"  **********************abou the command set**********
"  ---------------------------------------------------------------
:command W w
:command T Ntree
:command NT NERDTree

