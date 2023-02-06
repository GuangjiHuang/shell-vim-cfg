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
"Plug 'pechorin/any-jump.vim'
Plug 'easymotion/vim-easymotion'
"Plug 'bpstahlman/txtfmt'
Plug 'dhruvasagar/vim-table-mode'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Plug 'tommcdo/vim-exchange'
"Plug 'xuhdev/vim-latex-live-preview'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-obsession'
Plug 'preservim/nerdtree'
"Plug 'isnowfy/python-vim-instant-markdown'
"Plug 'iamcco/mathjax-support-for-mkdp'
"Plug 'iamcco/markdown-preview.nvim', {'do': {-> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'instant-markdown/vim-instant-markdown', {'for' : 'markdown', 'do': 'yarn install'}
"Plug 'preservim/vim-markdown', {'for', 'markdown'}
"Plug 'ycm-core/YouCompleteMe', {'for': ['c', 'cpp', 'python', 'shell', 'cmake']}
" the local plugin in the local
Plug '~/.vim/plugged/autocorrect'
Plug 'preservim/tagbar'
"Plug 'solyarisoftware/Highlight.vim'
Plug 'joanrivera/vim-highlight'
call plug#end()
"
" ^---------- easymotion ----------$
"
map <space><space> <Plug>(easymotion-prefix)
map gh <Plug>(easymotion-prefix)
"
" ^---------- markdown ----------$
"
" the markdown-vim setting
"let g:vim_markdown_folding_disable = 1
"" set header floding level
"let g:vim_markdown_folding_level = 6 "the value can be the 1 to 6
"" about the conceal
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
function! Goyoleave()
    set bg=dark
    hi CursorLine ctermbg=239 ctermfg=NONE cterm=NONE
endfunction

function! Goyoenter()
    set rnu
endfunction

" slove the problem that leave the goyo will change the colortheme
augroup goyo_control
    autocmd!
    au User GoyoLeave call Goyoleave()
    au User GoyoEnter call Goyoenter()
augroup END
"
" ^---------- limelight ----------$
"
let g:limelight_conceal_ctermfg = 0
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
"
" ^---------- Youcompleteme ----------$
let g:ycm_always_populate_location_list = 1
let g:ycm_auto_hover = "" | "default is the CursorHold
let g:ycm_error_symbol = 'E'
let g:ycm_warning_symbol = 'W'
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 'virtual-text'
" jumping
nmap <leader>yfw <Plug><YCMFindSymbolInWorkspace>
nmap <leader>yfd <Plug><YCMFindSymbolInDocument>
nmap <leader>j :YcmCompleter GoTo<CR>
nmap <leader>jc :YcmCompleter GoToCallees<CR>
nmap <leader>jdf :YcmCompleter GoToDefinition<CR>
nmap <leader>jdc :YcmCompleter GoToDeclaration<CR>
nmap <leader>jdo :YcmCompleter GoToDocumentOutline<CR>
nmap <leader>ji :YcmCompleter GoToInclude<CR>
nmap <leader>jI :YcmCompleter GoToImplementation<CR>
nmap <leader>jr :YcmCompleter GoToReferences<CR>
nmap <leader>js :YcmCompleter GoToSymbol
nmap <leader>jt :YcmCompleter GoToType<CR>
" ^---------- instant-vim-markdown ----------$
"filetype plugin on
"Uncomment to override defaults:
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 1
"let g:instant_markdown_open_to_the_world = 1
let g:instant_markdown_allow_unsafe_content = 1
let g:instant_markdown_allow_external_content = 1
let g:instant_markdown_mathjax = 1
let g:instant_markdown_mermaid = 1
let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
let g:instant_markdown_port = 8888
let g:instant_markdown_python = 0
"
" ^---------- tagbar ----------$
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_position = 'left'
"
" ^---------- vim-highlight ----------$
let g:lcolor_bg = "black"
let g:lcolor_fg = "yellow"
"
" ^---------- plugin_name ----------$
"
