"  -----------------------------------------------------------------------------------------
"  insert the vim command output to the current cursor
func! Exec(command)
    redir =>output
    silent exec a:command
    redir END
    return output
endfunc!

"  -----------------------------------------------------------------------------------------
" switch the files between the cpp/c and the hpp/h
"nnoremap <leader>% :call FindHeader()<CR>
function! FindHeader()
    let targetfile_c =""
    let targetfile_cpp =""
    if expand("%:e") == "h" || expand("%:e") == "hpp"
        let targetfile_c = expand("%:t:r") . ".c"
        let targetfile_cpp = expand("%:t:r") . ".cpp"
    else
        let targetfile_c = expand("%:t:r") . ".h"
        let targetfile_cpp = expand("%:t:r") . ".hpp"
    endif
    "
    let targetfile_c = findfile(targetfile_c, "**", -1)
    let targetfile_cpp = findfile(targetfile_cpp, "**", -1)
    let targetfile = targetfile_c + targetfile_cpp
    if empty(targetfile)
        let targetfile = findfile(targetfile_c, "../../**", -1)
        let targetfile += findfile(targetfile_cpp, "../../**", -1)
    endif
    "
    if empty(targetfile)
        echo "Not found!"
    else
        for onefile in targetfile
            silent exe ":e " . onefile
        endfor
        "echon "Found " . len(targetfile) . " files"
        echo "->" . onefile
    endif
endfunction

" -----------------------------------------------------------------------------------------
"  create the coresponding file for coding
function! IntoCodeEnv(code_language)
    let file_name = ""
    let file_name_suffix = ""
    if a:code_language == "c++"
        let file_name_suffix = ".cpp"
    elseif a:code_language == "vim"
        let file_name_suffix = ".vim"
    elseif a:code_language == "bash"
        let file_name_suffix = ".sh"
    elseif a:code_language == "cmake"
        let file_name_suffix = ".txt"
    elseif a:code_language == "python"
        let file_name_suffix = ".py"
    endif
    if empty(file_name_suffix)
        echo "Not the programming language!"
        return
    else
        let file_name = a:code_language . "_tmep" . file_name_suffix
        " edit the file_name
        exec ":e " . file_name
    endif
endfunction

"-----------------------------------------------------------------------------------------
" ./install.sh vim 
function! InstallVimToCfg()
    let cwd_path = getcwd()
    cd ~/mygithub/shell-vim-cfg/
    exec ":!. install.sh vim"
    exec "cd" . cwd_path
    pwd
endfunction

" -----------------------------------------------------------------------------------------
"  toggle to hide the tab bar or not
function! ToggleTabBar()
    let is_show_tab_bar = &showtabline
    if is_show_tab_bar
        set showtabline=0
    else
        set showtabline=1
    endif
endfunction

"-----------------------------------------------------------------------------------------
" to insert the ex comand content to the file, or redirct the output to the
" register z, you can change your own register
function! Exec(cmd)
    redir @z
    silent exec a:cmd
    " paste the @z to the cursor
    exec "put z"
    redir END
endfunction
    
"-----------------------------------------------------------------------------------------
" c,c++,python go to the function definition when you are in the middle of the funciton body  
function! GoBackToFunctionDefinition(jump_direction)
    let s_direct_flag = a:jump_direction=="backward" ? "b" : ""
    " mark the current position
    mark z
    let original_line_number = line(".")
    let fun_def_pattern = "^[a-zA-Z].*(.*)"
    let num_line = search(fun_def_pattern, s_direct_flag)
    if num_line
        echo original_line_number " -> " num_line
    else
        echo "No function definition!"
    endif
endfunction!

"-----------------------------------------------------------------------------------------
" the function that switch to the file's dir and the current dir
function! SwitchWorkDir()
    " get the current dir
    "if !exists("w:next_win_dir")
    "    let w:next_win_dir = getcwd()
    "    " change to the file current dir
    "    call chdir(expand("%:p:h"))
    "    echo w:next_win_dir . " -> " . getcwd()
    "else
    "    let tmp_dir = getcwd()
    "    " go to the next window dir
    "    call chdir(w:next_win_dir)
    "    let w:next_win_dir = tmp_dir
    "    echo w:next_win_dir . " -> " . getcwd()
    "endif
	let l:tmp_dir = getcwd()
	let l:current_file_dir = expand("%:p:h")
	call chdir(l:current_file_dir)
	echom l:tmp_dir . " -> " . l:current_file_dir
endfunction!

"-----------------------------------------------------------------------------------------

"-----------------------------------------------------------------------------------------
" zoom window / previous layout
function! ToggleZoom(zoom)
  if exists("t:restore_zoom") && (a:zoom == v:true || t:restore_zoom.win != winnr())
      exec t:restore_zoom.cmd
      unlet t:restore_zoom
  elseif a:zoom
      let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
      exec "normal \<C-W>\|\<C-W>_"
  endif
endfunction

augroup restorezoom
    au WinEnter * silent! :call ToggleZoom(v:false)
augroup END
"nnoremap <silent> <Leader>+ :call ToggleZoom(v:true)<CR>
nnoremap <silent> <Leader>z :call ToggleZoom(v:true)<CR>
nnoremap <silent> <space>z :call ToggleZoom<v:true><CR>

"-----------------------------------------------------------------------------------------
" swith the header and the source file
function! SwithHeaderSource()
    " Call the Python 3 code block
    python3 << EOF
import vim
import os

def check_if_target(dir_path, target_file_ls):
	files_ls = os.listdir(dir_path)
	for target_file in target_file_ls:
		if target_file in files_ls:
			return target_file
	return ""

final_target_path = ""
final_target_path_ls = []

# Get the name of the current file
current_file = vim.current.buffer.name
abs_current_file = os.path.abspath(current_file)
base_name = os.path.basename(abs_current_file)
dir_name = os.path.dirname(abs_current_file)
file_name_without_ext, ext = os.path.splitext(base_name)

print(file_name_without_ext, ext)

target_file_ls = []

if ext == ".c" or ext == ".cpp":
	target_file_ls.append(file_name_without_ext + ".h")
	target_file_ls.append(file_name_without_ext + ".hpp")
elif ext == ".h" or ext == ".hpp":
	target_file_ls.append(file_name_without_ext + ".c")
	target_file_ls.append(file_name_without_ext + ".cpp")
else:
	print("Not the c / cpp file, can not swith the hearder or source")

dir_ls = dir_name.split("/")
dir_len = len(dir_ls)
search_level = 4

# find the in the current dir
final_target_path = check_if_target(dir_name, target_file_ls)
#print(dir_ls)

if final_target_path == "":
	tmp_path = ""
	tmp_path_ls = list()
	# search the top level
	if dir_len - search_level < 3:
		search_level = dir_len - 3
	if search_level < 0:
		search_level = 1
	new_dir_ls = dir_ls[:-search_level + 1]
	new_top_dir = "/".join(new_dir_ls)
	#print(new_top_dir)
	for root, dirs, files in os.walk(new_top_dir):
		for dir_name in dirs:
			potential_path = os.path.join(root, dir_name)
			tmp_path = check_if_target(potential_path, target_file_ls)
			if tmp_path != "":
				final_target_path_ls.append(os.path.join(root, dir_name, tmp_path))
else: 
	final_target_path_ls.append(final_target_path)

if len(final_target_path_ls) == 0:
	print(f"Can not find the {target_file_ls}")
else:
	for idx, tmp_path in enumerate(final_target_path_ls):
		print(f"{idx}: {tmp_path}")

vim.vars['vim_var_from_python'] = final_target_path_ls

EOF
let path_ls = g:vim_var_from_python

if len(path_ls) == 1
	exec ":e " . path_ls[0]
elseif len(path_ls) > 1
	let idx = input("select the idx: \n")
	"echom path_ls[idx]
	exec ":e " . path_ls[idx]

endif

endfunction

" Map the function to a convenient key combination
" nnoremap <F5> :call SwithHeaderSource()<CR>
nnoremap <leader>& :call SwithHeaderSource()<CR>

"-----------------------------------------------------------------------------------------

"-----------------------------------------------------------------------------------------
" jump to the window from left to right
function! JumpToWindow(window_index)
    " Count the number of windows
    let window_count = winnr('$')

    " Check if the input is a valid window index
    if a:window_index >= 1 && a:window_index <= window_count
        " Jump to the selected window
        execute a:window_index . 'wincmd w'
    else
        echo "Invalid window index"
    endif
endfunction

" Map the function to convenient key combinations
nnoremap <space>1 :call JumpToWindow(1)<CR>
nnoremap <space>2 :call JumpToWindow(2)<CR>
nnoremap <space>3 :call JumpToWindow(3)<CR>
nnoremap <space>4 :call JumpToWindow(4)<CR>
nnoremap <space>5 :call JumpToWindow(5)<CR>

"-----------------------------------------------------------------------------------------
function! BuffersToQuickfix(pattern)
  " Get the list of buffers
	let l:buffers = filter(map(range(1, bufnr('$')), 'bufname(v:val)'), 'v:val != ""')
	" Clear the quickfix list
	call setqflist([])
	" Populate the quickfix list with buffer names and numbers
	let l:qflist = []
	for l:buf in l:buffers
		if a:pattern == '' || l:buf =~ a:pattern
		  call add(qflist, {'filename': l:buf, 'text': 'Buffer: ' . bufnr(l:buf)})
		endif
	endfor
	call setqflist(l:qflist)
	below copen
endfunction

nnoremap <leader>ls :call BuffersToQuickfix('')<CR>
nnoremap <leader>lh :call BuffersToQuickfix('\.h$')<CR>
nnoremap <leader>lc :call BuffersToQuickfix('\.c\|\.cpp$')<CR>

"-----------------------------------------------------------------------------------------
function! Wr(topic, date)
python3 << EOF
import vim
import time
import os

output_path = ""
vim.vars['wr_output_path'] = output_path
topic = vim.eval('a:topic')
date = vim.eval('a:date')
if topic not in ["temp", "plan", "question", "learn"]:
	exit

# deal the date

l_tm = time.localtime()
s_year = c_year = l_tm.tm_year
s_month = c_month = l_tm.tm_mon
s_day = c_day = l_tm.tm_mday

if len(date) == 0:
	pass
else:
	date_ls = date.split("-")
	if len(date_ls) == 1:
		s_day = date_ls[0]
		if s_day.isdigit():
			s_day = int(s_day)
		else:
			exit
	elif len(date_ls) == 2:
		s_month, s_day = date_ls
		if s_month.isdigit() and s_day.isdigit():
			s_month, s_day = int(s_month), int(s_day)
		else:
			exit
	elif len(date_ls) == 3:
		s_year, s_month, s_day = date_ls
		if s_year.isdigit() and s_month.isdigit() and s_day.isdigit():
			s_year, s_month, s_day = int(s_year), int(s_month), int(s_day)
		else:
			exit
# check the year and the month and the day
if s_year <= 2020:
	print(f"invalid year: {s_year}")
	exit
if s_month > 12 or s_month < 1:
	print(f"invalid month: {s_month}")
if s_day > 31 or s_day < 0:
	print(f"invalid day: {s_day}")
output_path = f"~/mygithub/everyday-record/{s_year}-{s_month:02}/{s_month:02}-{s_day:02}/{topic}.txt"
output_path = os.path.expanduser(output_path)
#print(f"output_path: {output_path}")
if not os.path.exists(output_path):
	if s_year == c_year and s_month == c_month and s_day == c_day:
		#dir_path = os.path.dirname(output_path)
		#if not os.path.exists(dir_path):
		#	os.makedirs(dir_path)
		#os.system(f"touch {output_path}")
		os.system("wr > /dev/null")
	else:
		print(f"{output_path}: no exists!")
		output_path = ""
		exit
vim.vars['wr_output_path'] = output_path
EOF
let wr_output_path = g:wr_output_path
if wr_output_path != ""
	exec ":e ". wr_output_path
endif
endfunction

"-----------------------------------------------------------------------------------------
function! ToggleGDBTerminal(terminal_name)
	if a:terminal_name == "gdb"
		let l:buffer_name = "!gdb"
	elseif a:terminal_name == "program"
		let l:buffer_name = "debugged program"
	elseif a:terminal_name == "bash"
		let l:buffer_name = "!bash"
	endif

	let l:term_buf_exists = bufexists(l:buffer_name)

	if l:term_buf_exists
		execute 'silent! vs | buffer ' . l:buffer_name
	else
		if a:terminal_name == "gdb" || a:terminal_name == "program"
			exec ':vert Termdebug'
		else
			exec ':vert terminal ' . a:terminal_name
		endif
	endif
endfunction

"-----------------------------------------------------------------------------------------
"
