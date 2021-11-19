"  ---------------------------------------------------------------
"  >> <leader>+x <<
"  ---------------------------------------------------------------
"  a <append>
"
"  b
" 
"  c C <comment>
au FileType cpp,c nnoremap <buffer> <localleader>c I//<esc>
au FileType cpp,c nnoremap <buffer> <localleader>C :silent s/\/\//<CR>
au FileType python,cmake,sh nnoremap <buffer> <localleader>c I#<esc>
au FileType python,cmake,sh nnoremap <buffer> <localleader>C :silent s/#//<CR>
au FileType vim nnoremap <buffer> <localleader>c I"<esc>
au FileType vim nnoremap <buffer> <localleader>C :silent s/"//<CR>
"
"  d
command! DeleteBuffer execute '%bd|e #|normal `"'
nnoremap <leader>db :DeleteBuffer<CR>
"  e
"  ex command
nnoremap <leader>el :ls<CR>
nnoremap <leader>em :marks<CR>
nnoremap <leader>er :reg 
nnoremap <leader>eq :q!<CR> 
nnoremap <leader>ew :w<CR>
nnoremap <leader>ex :x<CR>
"nnoremap <leader>e
"nnoremap <leader>e
"  f <function>
"
"  g 
" Goyo
nnoremap <leader>g :Goyo 60%x100%<Cr>
"  h
"  i
"  j
"  k
"  l
nnoremap <leader>l :Limelight!!<Cr>
"  m
"  n
"  o
"  p
"  q
"  r R
"  execute run
nnoremap <leader>r :w \| !. ../run %<CR>
nnoremap <leader>R :w \| !. ./run %<CR>
"  s
nnoremap <leader>s :source ~/.vimrc "\| echom "->Source the ~/.vimrc"<CR>
"  t
nnoremap <leader>t :NERDTree<CR>
nnoremap <leader>T :Ntree<CR>
"  u
"  v <vim>
"  -> func.vim
nnoremap <leader>vf :e ~/.vim/hgj-vim-config/func.vim<CR>
" -> map.vim
nnoremap <leader>vm :e ~/.vim/hgj-vim-config/map.vim<CR>
" -> plugin_setting.vim
nnoremap <leader>vp :e ~/.vim/hgj-vim-config/plugin_setting.vim<CR>
" -> .vimrc
nnoremap <leader>vr :e ~/.vimrc<CR>
"  w
nnoremap <leader>w :w<CR>
"  x
"  y
"  z
"  %
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
