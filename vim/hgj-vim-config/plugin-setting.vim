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
"Plug 'dhruvasagar/vim-table-mode'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
"Plug 'tommcdo/vim-exchange'
Plug 'chrisbra/unicode.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
"Plug 'tpope/vim-obsession'
Plug 'preservim/nerdtree'
"Plug 'ycm-core/YouCompleteMe', {'for': ['c', 'cpp', 'python', 'sh', 'cmake', 'make', 'vim']}
" the local plugin in the local
Plug '~/.vim/plugged/autocorrect'
Plug 'preservim/tagbar'
"Plug 'solyarisoftware/Highlight.vim'
Plug 'joanrivera/vim-highlight'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'dense-analysis/ale'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-fugitive'
Plug 'gcmt/taboo.vim'
Plug 'rbong/vim-flog'
Plug 'vim-airline/vim-airline'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'kawre/leetcode.nvim'
call plug#end()
"
" ^---------- easymotion ----------$
"
"nnoremap <space><space> <Plug>(easymotion-prefix)
nnoremap gh <Plug>(easymotion-prefix)
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
if (0)
	let g:ycm_always_populate_location_list = 1
	let g:ycm_auto_hover = "" | "default is the CursorHold
	let g:ycm_error_symbol = 'E'
	let g:ycm_warning_symbol = 'W'
	let g:ycm_enable_diagnostic_highlighting = 0
	let g:ycm_echo_current_diagnostic = 'virtual-text'
	"let g:ycm_enable_inlay_hints = 1
	" jumping
	nmap <leader>yfw <Plug>(YCMFindSymbolInWorkspace)
	nmap <leader>yfd <Plug>(YCMFindSymbolInDocument)
	nnoremap <leader>j :YcmCompleter GoTo<CR>
	nnoremap <leader>jc :YcmCompleter GoToCallees<CR>
	nnoremap <leader>jdf :YcmCompleter GoToDefinition<CR>
	nnoremap <leader>jdc :YcmCompleter GoToDeclaration<CR>
	nnoremap <leader>jdo :YcmCompleter GoToDocumentOutline<CR>
	nnoremap <leader>ji :YcmCompleter GoToInclude<CR>
	nnoremap <leader>jI :YcmCompleter GoToImplementation<CR>
	nnoremap <leader>jr :YcmCompleter GoToReferences<CR>
	nnoremap <leader>js :YcmCompleter GoToSymbol
	nnoremap <leader>jt :YcmCompleter GoToType<CR>
	" diags
	nnoremap <leader>yd :YcmDiags<CR>
	nnoremap <leader>yfi :YcmCompleter FixIt<CR>
endif

"
" ^---------- tagbar ----------$
nnoremap <leader>tb :TagbarToggle<CR>
let g:tagbar_position = 'right'
" 0: sort by file appearence; 1: sort by name
let g:tagbar_sort = 0
"
" ^---------- vim-highlight ----------$
let g:lcolor_bg = "black"
let g:lcolor_fg = "yellow"
"
"^---------- ALE ----------$
if (1)
	let g:ale_enabled = 1
	" default is the 10 ms, set to the 1s
	let g:ale_echo_delay = 1000
	let g:ale_hover_cursor = 1
	let g:ale_completion_enabled = 1
	"let g:ale_hover_to_floating_preview = 1
	let g:ale_set_balloons = 1

	"let g:ale_linters = ['clangd']
	"
	let $PYTHONPATH = expand('~') . '/isp/mars3/isp-tool-daemon-cmodel/cmodel'
	let g:ale_linters = {
				\	"c": ["ccls", "clangd", "cppcheck", "cquery"],
				\	"cpp": ["clangd"],
				\	"sh": ["shellcheck"],
				\	"make": ["makecheck"],
				\	"python": ["jedils", "pylsp"],
				\}
	let g:ale_virtualtext_cursor = 'disable'
	let g:ale_fixers = {
				\	"c": ["astyle", "clang-format"],
				\	"python": ["autopep8"],
				\	"*": ["remove_trailing_lines", "trim_whitespace"],
				\}
	nnoremap <leader>jd :ALEGoToDefinition<CR>
	nnoremap <leader>jt :ALEGoToTypeDefinition<CR>
	nnoremap <leader>ji :ALEGoToImplementation<CR>
	nnoremap <leader>jr :ALEFindReferences<CR>
	nnoremap <leader>hv :ALEHover<CR>
	nnoremap <leader>anw :ALENext -warning<CR>
	nnoremap <leader>apw :ALEPrevious -warning<CR>
	nnoremap <leader>ane :ALENext -error<CR>
	nnoremap <leader>ape :ALEPrevious -error<CR>
	nnoremap <leader>an :ALENext<CR>
	nnoremap <leader>ap :ALEPrevious<CR>

	" re map the completion keybind
	inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	"inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"
	"
	nnoremap <leader>js :ALESymbolSearch <C-R><c-W><CR>

	let g:airline#extensions#ale#enabled = 1

	let g:ale_sign_error = 'E'
	let g:ale_sign_warning = 'W'

	"highlight clear ALEErrorSign
	"highlight clear ALEWarningSign

	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

	let g:ale_set_highlights = 0

endif
"
" ^---------- buffergator ----------$
let g:buffergator_show_full_directory_path = 0
" default size is 40
let g:buffergator_vsplit_size = 30
" ^---------- taboo ----------$

" ^---------- termdeubg ----------$
packadd termdebug
let g:termdebug_wide = 1
let g:termdebug_winbar = 0
let g:termdebug_popup = 0
let g:termdebug_use_prompt = 0
" <C-@> = ctrl + space
set termwinkey=<C-@>
map ,w :call TermDebugSendCommand('where')<CR>
nnoremap <silent> <Leader>d :Tjump<CR>
" Enable Termdebug
packadd termdebug

" Function to jump to the current debug line
function! JumpToDebugLine()
    " Execute the GDB 'frame' command to get the current debug line
    call term_sendkeys(g:termdebugger, "frame\n")
    " Wait for the output to be processed
    sleep 100m
    " Execute the GDB 'list' command to update the cursor position
    call term_sendkeys(g:termdebugger, "list\n")
endfunction

" Map <Leader>d to jump to the current GDB debug line
nnoremap <silent> <Leader>d :call JumpToDebugLine()<CR>

" ^---------- fugitvie ----------$
set diffopt+=vertical
"
" ^---------- vim-airline ----------$
"let g:airline_section_a = ''
"let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_mode_map = {
  \ '__'     : '-',
  \ 'c'      : 'C',
  \ 'i'      : 'I',
  \ 'ic'     : 'I',
  \ 'ix'     : 'I',
  \ 'n'      : 'N',
  \ 'multi'  : 'M',
  \ 'ni'     : 'N',
  \ 'no'     : 'N',
  \ 'R'      : 'R',
  \ 'Rv'     : 'R',
  \ 's'      : 'S',
  \ 'S'      : 'S',
  \ ''     : 'S',
  \ 't'      : 'T',
  \ 'v'      : 'V',
  \ 'V'      : 'V',
  \ ''     : 'V',
  \ }
"
" ^---------- plugin_name ----------$
"
" ^---------- plugin_name ----------$
"
" ^---------- plugin_name ----------$
"
