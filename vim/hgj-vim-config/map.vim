"  ===============================================================
"  >> <leader>+x <<  @Guangji Huang
"  ===============================================================
" -------------------------------------------a/A-------------------------------------------
"  \a <append>
"
" -------------------------------------------b/B-------------------------------------------
"  \b
" 
" -------------------------------------------c/C-------------------------------------------
"  \c C <comment>
au FileType cpp,c nnoremap <buffer> <localleader>c I//<esc>
au FileType cpp,c nnoremap <buffer> <localleader>C :silent s/\/\//<CR>
au FileType python,cmake,sh nnoremap <buffer> <localleader>c I#<esc>
au FileType python,cmake,sh nnoremap <buffer> <localleader>C :silent s/#//<CR>
au FileType vim nnoremap <buffer> <localleader>c I"<esc>
au FileType vim nnoremap <buffer> <localleader>C :silent s/"//<CR>
"
" -------------------------------------------d/D-------------------------------------------
" \d <delete>
command! DeleteBuffer execute '%bd|e #|normal `"'
nnoremap <leader>db :DeleteBuffer<CR>
" delete the % file
nnoremap <leader>d% :!rm % \| redraw!<CR>
" -------------------------------------------e/E-------------------------------------------
" \e
" ex command
nnoremap <leader>el :ls<CR>
nnoremap <leader>em :marks<CR>
nnoremap <leader>er :reg 
nnoremap <leader>eq :q!<CR> 
nnoremap <leader>ew :w<CR>
nnoremap <leader>ex :x<CR>
"nnoremap <leader>e
"nnoremap <leader>e
" -------------------------------------------f/F-------------------------------------------
" \f <function>
"
" -------------------------------------------g/G-------------------------------------------
" \g 
" Goyo
nnoremap <leader>g :Goyo 60%x100%<Cr>
" -------------------------------------------h/H-------------------------------------------
" \h
" -------------------------------------------i/I-------------------------------------------
" \i <into the code env>
nnoremap <leader>ib :call IntoCodeEnv("bash")<CR>
nnoremap <leader>ic :call IntoCodeEnv("c++")<CR>
nnoremap <leader>im :call IntoCodeEnv("cmake")<CR>
nnoremap <leader>ip :call IntoCodeEnv("python")<CR>
nnoremap <leader>iv :call IntoCodeEnv("vim")<CR>
" -------------------------------------------j/J-------------------------------------------
" \j
" -------------------------------------------k/K-------------------------------------------
" \k
" -------------------------------------------l/L-------------------------------------------
" \l
nnoremap <leader>l :Limelight!!<Cr>
" -------------------------------------------m/M-------------------------------------------
" \m
" -------------------------------------------n/N-------------------------------------------
" \n
" -------------------------------------------o/O-------------------------------------------
" \o
" -------------------------------------------p/P-------------------------------------------
" \p
" -------------------------------------------q/Q-------------------------------------------
" \q
" -------------------------------------------r/R-------------------------------------------
" \r R
" run the code
" c/c++ with or without cmake
nnoremap <leader>rc :w \| !. ../run %<CR>
nnoremap <leader>Rc :w \| !. ./run %<CR>
" vimscript
nnoremap <leader>rv :w \| source %<CR>
" python
nnoremap <leader>rp :w \| !python3 %<CR>
nnoremap <leader>rP :w \| !python.exe %<CR>
" bash
nnoremap <leader>rb :w \| !. %<CR>
nnoremap <leader>rB :w \| !bash %<CR>
" cmake
nnoremap <leader>rm :w \| !cmake -P %<CR>
" -------------------------------------------s/S-------------------------------------------
" \s
nnoremap <leader>s :source ~/.vimrc "\| echom "->Source the ~/.vimrc"<CR>
" -------------------------------------------t/T-------------------------------------------
" \t  <tab, Tree>
" <tab>
nnoremap <leader>th :call ToggleTabBar()<CR>
nnoremap <leader>te :tabedit 
nnoremap <leader>tF :tabfind 
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tf :tabfirst<CR>
" <TREE>
nnoremap <leader>T :NERDTree<CR>
"nnoremap <leader>T :Ntree<CR>
" -------------------------------------------u/U-------------------------------------------
" \u
" -------------------------------------------v/V-------------------------------------------
" \v <vim>
"  -> func.vim
nnoremap <leader>vf :e ~/.vim/hgj-vim-config/func.vim<CR>
" -> map.vim
nnoremap <leader>vm :e ~/.vim/hgj-vim-config/map.vim<CR>
" -> plugin_setting.vim
nnoremap <leader>vp :e ~/.vim/hgj-vim-config/plugin_setting.vim<CR>
" -> .vimrc
nnoremap <leader>vs :e ~/.vimrc<CR>
" ./install.sh vim
nnoremap <leader>vi :call InstallVimToCfg()<CR>
" -------------------------------------------w/W-------------------------------------------
" \w
nnoremap <leader>w :w<CR>
" -------------------------------------------x/X-------------------------------------------
" \x
" -------------------------------------------y/Y-------------------------------------------
" \y
" -------------------------------------------z/Z-------------------------------------------
" \z
" -------------------------------------------%/%-------------------------------------------
" \%
nnoremap <leader>% :call FindHeader()<CR>
"
"
"
"  ---------------------------------------------------------------
"  >> <custonm_leader>+x <<
"  ---------------------------------------------------------------
" use the _ as the leader to map some ex command
nnoremap _c :close<CR>
nnoremap _m :marks<CR>
map _l :ls<CR>


"  ---------------------------------------------------------------
"  >>  Maping the key <<
"  ---------------------------------------------------------------
inoremap jj <esc>
"about the jump to the window quickly
nnoremap gw <c-w>
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
"about the buffer
"nnoremap [b :bp<Enter>  " the last one
"nnoremap ]b :bn<Enter>  " the next one
