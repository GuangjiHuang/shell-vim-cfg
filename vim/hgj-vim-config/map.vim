" =============================================================== 
"  >> <leader>+x <<  @Guangji Huang
"  ===============================================================
" -------------------------------------------a/A-------------------------------------------
"  \a <append>
"  append time
" nnoremap <leader>at :call Exec('echo strftime("%c")')<CR>
" use this for debug
nnoremap <leader>ab :Break<CR>
nnoremap <leader>aB :Tbreak<CR>
nnoremap <leader>as :Step<CR>
nnoremap <leader>an :Over<CR>
nnoremap <leader>au :Until<CR>
nnoremap <leader>af :Finish<CR>
nnoremap <leader>ac :Continue<CR>
nnoremap <leader>aS :Stop<CR>
nnoremap <leader>aw :call TermDebugSendCommand('where')<CR>
nnoremap <leader>al :call TermDebugSendCommand('locals')<CR>
nnoremap <leader>aC :call TermDebugSendCommand('shell clear')<CR>

" -------------------------------------------b/B-------------------------------------------
"  \b
nnoremap <leader>bd :bp<bar>sp<bar>bn<bar>bd<CR>
nnoremap <leader>bc :bufdo if !bufwinnr(bufnr('%'))<bar>bd<bar>endif<CR>
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
" vimdiff
"nnoremap dp [c
"nnoremap dn ]c
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

inoremap <leader>eq :q!<CR> 
inoremap <leader>ew <C-O>:w<CR>
inoremap <leader>ex :x<CR>
inoremap <leader>ee :e!<CR>
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
nnoremap <leader>gw :vimgrep /<C-R>=expand("<cword>")<CR>/gj **/*.h **/*.c **/*.cpp
" -------------------------------------------h/H-------------------------------------------
" \h
" hight light the line
nnoremap <leader>hh :Highlight h<CR>
" cancle the highlight
nnoremap <leader>hn :Highlight n<CR>
inoremap hw <C-o>ciw
inoremap hW <C-o>ciW
inoremap hh <C-o>s
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
nnoremap <leader>ll :Limelight!!<cr>
" -------------------------------------------m/M-------------------------------------------
" \m
" -------------------------------------------n/N-------------------------------------------
" \n
" inser the code note
nnoremap <leader>N :put =['/*HGJ note:', '    ', '*/']<CR>kA

" -------------------------------------------o/O-------------------------------------------
" \o
" -------------------------------------------p/P-------------------------------------------
" \p
" -------------------------------------------q/Q-------------------------------------------
" \q
nnoremap <leader>qq :q!<CR>
"<quickfix> operation
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>
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
nnoremap <leader>S :source ~/.vimrc \| echom "->Source the ~/.vimrc"<CR>
"  edit func.vim
nnoremap <leader>sf :e ~/.vim/hgj-vim-config/func.vim<CR>
" edit map.vim
nnoremap <leader>sm :e ~/.vim/hgj-vim-config/map.vim<CR>
" edit plugin_setting.vim
nnoremap <leader>sp :e ~/.vim/hgj-vim-config/plugin-setting.vim<CR>
" edit .vimrc
nnoremap <leader>ss :e ~/.vimrc<CR>
" edit the bash
nnoremap <leader>sbs :e ~/.bashrc<CR>
nnoremap <leader>sba :e ~/.bash_aliases<CR>
" edit the git
nnoremap <leader>sg :e ~/.gitconfig<CR>
" highlight the current word.
"nnoremap <leader>sw :let @/=<C-r>=expand("<cword>")\<CR>\><CR>:match Search /<C-r>=@/<CR>
" -------------------------------------------t/T-------------------------------------------
"  \t
" <tab>
nnoremap <leader>th :call ToggleTabBar()<CR>
nnoremap <leader>te :tabedit 
"nnoremap <leader>tF :tabfind 
nnoremap <leader>tc :tabclose<CR>
nnoremap <leader>to :tabonly<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tl :tablast<CR>
"nnoremap <leader>tf :tabfirst<CR>
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

" <NERDTree>
nnoremap <leader>tr :NERDTreeToggle<CR>
nnoremap <leader>tR :NERDTree<CR>
nnoremap <leader>T :NERDTreeFocus<CR>
nnoremap <leader>tf :NERDTreeFind \| normal zz<CR>

" -------------------------------------------u/U-------------------------------------------
" \u
" -------------------------------------------v/V-------------------------------------------
" \v <vim>
"nnoremap <leader>vt :exec strftime("e ~/mygithub/everyday-record/%Y-%m/%m-%d/temp.txt", localtime())<CR>
nnoremap <leader>vq :call Wr("question", "")<CR>
nnoremap <leader>vt :call Wr("temp", "")<CR>
nnoremap <leader>vp :call Wr("plan", "")<CR>
nnoremap <leader>vl :call Wr("learn", "")<CR>
nnoremap <leader>vc :call Wr("code", "")<CR>
nnoremap <leader>vt :call Wr("code_task", "")<CR>
nnoremap <leader>va :call Wr("arragement", "")<CR>
nnoremap <leader>vr :call Wr("record", "")<CR>

command! -nargs=1 WrQuestion :call Wr("question", <q-args>)
command! -nargs=1 WrLearn :call Wr("learn", <q-args>)
command! -nargs=1 WrCode :call Wr("code", <q-args>)
command! -nargs=1 WrCodetask :call Wr("code_task", <q-args>)
command! -nargs=1 WrArragement :call Wr("arragement", <q-args>)
command! -nargs=1 WrRecord :call Wr("record", <q-args>)

nnoremap <leader>vQ :WrQuestion <C-r>=input("")<CR><CR>
nnoremap <leader>vL :WrLearn <C-r>=input("")<CR><CR>
nnoremap <leader>vC :WrCode <C-r>=input("")<CR><CR>
nnoremap <leader>vT :WrCodetask <C-r>=input("")<CR><CR>
nnoremap <leader>vA :WrArragement <C-r>=input("")<CR><CR>
nnoremap <leader>vR :WrRecord <C-r>=input("")<CR><CR>
"nnoremap <leader>vT :call Wr("temp", "")<CR>
"nnoremap <leader>vL :call Wr("learn", "")<CR>
" -------------------------------------------w/W-------------------------------------------
" \w
" do deal with the terminal window
nnoremap <leader>wb :call ToggleGDBTerminal("bash")<CR>
nnoremap <leader>wd :call ToggleGDBTerminal("gdb")<CR>
nnoremap <leader>wp :call ToggleGDBTerminal("program")<CR>
" write to the register
" in the function file 
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
" -------------------------------------------%//-------------------------------------------
" \/
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
" window dealing
nnoremap gw <c-w>
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

" moving window
" p: previous window, w: clockwise move
nnoremap <space>h <c-w>h
nnoremap <space>j <c-w>j
nnoremap <space>k <c-w>k
nnoremap <space>l <c-w>l
nnoremap <space>p <c-w>p
nnoremap <space>w <c-w>w
nnoremap <space>W <c-w>W
" resize window
" =: equal size; <, >: width change; +,-: vertical change
nnoremap <space>= <c-w>=
nnoremap <space>< <c-w><
nnoremap <space>> <c-w>>
nnoremap <space>+ <c-w>+
nnoremap <space>- <c-w>-
nnoremap <space>_ <c-w>_
nnoremap <space>\| <c-w>\|

nnoremap <space>c <C-w>c
nnoremap <space>o <C-w>o

nnoremap <space><space> <C-w>=


" move and exchange the window
nnoremap <space>x <C-W>x
nnoremap <space>H <C-W>H
nnoremap <space>L <C-W>L

nnoremap <silent> <space>/ :let @/ = ""<CR>

"  ---------------------------------------------------------------
"  >>  match braces <<
"  ---------------------------------------------------------------
inoremap {<CR> {<CR>}<C-o>O
inoremap <c-l> <right>

"  ---------------------------------------------------------------
"  >> space insert mode <<
"  ---------------------------------------------------------------
inoremap <c-o> <esc>o


"  ---------------------------------------------------------------
"  set the build
"  ---------------------------------------------------------------
set errorformat=%f:%l:%c:%t:%m
nnoremap <F9> :make<CR>:copen<CR>
"
"  ---------------------------------------------------------------
"  forbid the key
"  ---------------------------------------------------------------
"inoremap <BS> <Nop>
"inoremap <C-h> <C-o>:s

