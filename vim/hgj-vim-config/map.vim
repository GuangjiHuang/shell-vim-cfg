"  =============================================================== "  >> <leader>+x <<  @Guangji Huang
"  ===============================================================
" -------------------------------------------a/A-------------------------------------------
"  \a <append>
"  append time
nnoremap <leader>at :call Exec('echo strftime("%c")')<CR>

" -------------------------------------------b/B-------------------------------------------
"  \b
nnoremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
" -------------------------------------------c/C-------------------------------------------
"  \c C <comment>
au FileType cpp,c nnoremap <buffer> <leader>c I//<esc>
au FileType cpp,c nnoremap <buffer> <leader>C :silent s/\/\//<CR>
au FileType python,cmake,sh nnoremap <buffer> <leader>c I#<esc>
au FileType python,cmake,sh nnoremap <buffer> <leader>C :silent s/#//<CR>
au FileType vim nnoremap <buffer> <leader>c I"<esc>
au FileType vim nnoremap <buffer> <leader>C :silent s/"//<CR>
"nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <leader>cd :call SwitchWorkDir()<CR>
"
" -------------------------------------------d/D-------------------------------------------
" \d <delete>
command! DeleteBuffer execute '%bd|e #|normal `"'
nnoremap <leader>db :DeleteBuffer<CR>
" delete the % file
nnoremap <leader>D% :!rm % \| redraw!<CR>
" -------------------------------------------e/E-------------------------------------------
" \e
" ex command
nnoremap <leader>el :ls<CR>
nnoremap <leader>em :marks<CR>
nnoremap <leader>er :reg 
nnoremap <leader>eq :q!<CR> 
nnoremap <leader>ew :w<CR>
nnoremap <leader>ex :x<CR>
nnoremap <leader>ee :e!<CR>
"nnoremap <leader>e
"nnoremap <leader>e
" -------------------------------------------f/F-------------------------------------------
" \f <function> <file>
nnoremap <leader>ff :file<CR>
nnoremap <leader>fd :call GoBackToFunctionDefinition("backward")<CR>
nnoremap <leader>fD :call GoBackToFunctionDefinition("forward")<CR>
"nnoremap <leader>fb [[ 
"command! GoBackToFunctionDefinition execute "normal! /^[a-z].*(.*)\<cr>N"
"au FileType cpp,c,python nnoremap <leader>gd :GoBackToFunctionDefinition<cr>
"
" -------------------------------------------g/G-------------------------------------------
" \g 
" Goyo
nnoremap <leader>gy :Goyo 60%x100%<Cr>
" -------------------------------------------h/H-------------------------------------------
" \h
" hight light the line
nnoremap <leader>hh :Highlight h<CR>
" cancle the highlight
nnoremap <leader>hn :Highlight n<CR>
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
nnoremap <leader>l :Limelight!!<cr>
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
"nnoremap <leader>rc :w \| !. ./run %<CR>
nnoremap <leader>rc :w \| !../test<CR>
nnoremap <leader>Rc :w \| !. ../run %<CR>
" vimscript
nnoremap <leader>rv :w \| source %<CR>
" python
nnoremap <leader>rp :w \| !clear;python3 %<CR>
nnoremap <leader>rP :w \| !clear;python.exe %<CR>
" bash
nnoremap <leader>rb :w \| !clear;. %<CR>
nnoremap <leader>rB :w \| !clear;bash %<CR>
" cmake
nnoremap <leader>rm :w \| !clear;cmake -P %<CR>
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
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<CR>

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
" \y <use to copy the line>
" -------------------------------------------z/Z-------------------------------------------
" \z
nnoremap zq :q!<CR> | " quit force, not savethe 
nnoremap zp :w<CR> | " save
nnoremap zP :x<CR> | " save and then exit

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
" insert mappings
inoremap jj <esc>
" disable the esc, just practice the jj
"inoremap <esc> <nop> # I don't know why, this make the errro, if you key
"shift + other key, it will show as the [ss;2u], strange!
inoremap <C-u> <esc>gUiwea

" normal mappings
"about the jump to the window quickly
nnoremap gw <c-w>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

"  ---------------------------------------------------------------
"  >>  match braces <<
"  ---------------------------------------------------------------
inoremap {<CR> {<CR>}<C-o>O
inoremap ( ()<esc>ha
inoremap [ []<esc>ha
inoremap " ""<esc>ha
"inoremap ' ''<esc>ha
"
"inoremap kk <esc>la
inoremap <c-l> <right>

"  ---------------------------------------------------------------
"  >> space insert mode <<
"  ---------------------------------------------------------------
inoremap <c-o> <esc>o
inoremap <c-h> <esc>ciw
"
