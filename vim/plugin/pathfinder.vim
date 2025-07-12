" =======================
" PathFinder Plugin v1.2
" ========================

let s:current_file = expand('<sfile>')
let g:hgj_path_finder_current_file = s:current_file

"if exists('g:loaded_pathfinder')
"    finish
"endif
let g:loaded_pathfinder = 1

let g:base_search_path = '/data/guangji.huang/mars3l/'
let g:last_search_file = ''
let g:pathfinder_tool_priority = get(g:, 'pathfinder_tool_priority', 'auto') " rg > ag > grep
let g:path_finder_ori_path = &path


" kernel function ==========================================
" Enter: show the base path
" %: current file's dirpath
" &: current dir
function! s:SetBasePath(path) abort
	if a:path == ''
		if exists('g:base_search_path')
			echo g:base_search_path
		else
			echo 'Base path not set yet'
		endif
		return
	endif
	
    let processed_path = substitute(a:path, '^&', getcwd(), '')
    let expanded_path = expand(processed_path)
    let abs_path = fnamemodify(expanded_path, ':p')
    let abs_path = substitute(abs_path, '[\\/]\+$', '', '')

	let base_path_is_ok = 0

    if isdirectory(abs_path)
        let g:base_search_path = abs_path
		let base_path_is_ok = 1
        echo 'Base path set to: ' . abs_path
	elseif filereadable(abs_path)
        let dir_path = fnamemodify(abs_path, ':h')
        if isdirectory(dir_path)
            let g:base_search_path = dir_path
			let base_path_is_ok = 1
            echo 'Base path set to parent directory: ' . dir_path
        else
            echoerr 'Parent directory not found: ' . dir_path
        endif
    else
        echoerr 'Invalid directory: ' . abs_path
    endif

	" add the base path to the &path
	if base_path_is_ok == 1
		"let &path = g:path_finder_ori_path . "," . g:base_search_path
		let &path = "/usr/include," . g:base_search_path . "/**"
	endif
endfunction

function! s:SearchFiles(pattern) abort
    if !s:ValidateBasePath() | return | endif
    let tmpfile = tempname()

    let cmd = printf("find %s -name %s",
                \ shellescape(g:base_search_path),
                \ shellescape(a:pattern))

    let output = systemlist(cmd)
    
    if v:shell_error || empty(output)
        echo "No files found for pattern: " . a:pattern
        return
    endif

    call writefile(output, tmpfile)
    call s:OpenResult(tmpfile)
endfunction

function! s:GrepContent(input) abort
    if !s:ValidateBasePath() | return | endif
    let [content_pat, file_pat] = split(a:input, '\s\+', 1)[0:1]
    
    if empty(content_pat) || empty(file_pat)
        echoerr 'wrong format! right format：reg_content reg_file'
        return
    endif

    let tmpfile = tempname()
    let [finder, grepper] = s:SelectTools()

    let find_cmd = printf('%s %s \( -path "*/.ccls-cache" -o -path "*/build" \) -prune -o -type f -name %s -print',
                \ finder,
                \ shellescape(g:base_search_path),
                \ shellescape(file_pat))

    let grep_cmd = printf('%s --color=never -sIEn %s',
                \ grepper,
                \ shellescape(content_pat))

    let full_cmd = find_cmd . ' | xargs ' . grep_cmd
	
	"echo "\n" 
	"echo full_cmd
	"echo "\n"

    let output = systemlist(full_cmd)

    if v:shell_error
        echo empty(output) ? "no match result" : "error: " . join(output, ' ')
        return
    endif

    if empty(output)
        echo "no match content"
        return
    endif

    call writefile(output, tmpfile)
    call s:OpenResult(tmpfile)
endfunction

function! s:OpenResult(tmpfile) abort
    if filereadable(a:tmpfile) && getfsize(a:tmpfile) > 0
        execute 'vertical rightbelow split ' . a:tmpfile
        setlocal buftype=nowrite bufhidden=delete nobuflisted
        let g:last_search_file = a:tmpfile
        setlocal nomodifiable
        syntax match Comment /^[^:]\+/
        syntax match Constant /^[^:]\+\zs:\d\+:/
        syntax match String /:\zs.*$/
    else
        echo "search is empty!"
    endif
endfunction

function! s:ValidateBasePath() abort
    if !isdirectory(g:base_search_path)
        echoerr "invalid path! current path: " . g:base_search_path
        return 0
    endif
    return 1
endfunction

function! s:SelectTools() abort
    let finder = 'find'
    let grepper = 'grep -E'

    " use the fastest tool
    "if executable('rg') && (g:pathfinder_tool_priority ==# 'rg' || g:pathfinder_tool_priority ==# 'auto')
    "    return ['fd -t f -j4', 'rg --vimgrep']  " parallel search
    "elseif executable('ag')
    "    return ['ag -g', 'ag --nogroup']
    "endif

    return [finder, grepper]
endfunction

function! s:SelectBasePathFromConfig() abort
    let config_file = fnamemodify(s:current_file, ':p:h') . "/base_path.conf"
	echo "config_file: " . config_file

    if !filereadable(config_file)
        echoerr 'Path config file not found: ' . config_file
        return
    endif

    let raw_lines = readfile(config_file)
    let candidates = []
    for line in raw_lines
        if line =~# '^\s*#' || line =~# '^\s*$'
            continue
        endif

        let processed = substitute(line, '%', getcwd(), 'g')
        let abs_path = fnamemodify(processed, ':p')
        call add(candidates, abs_path)
    endfor

    let unique_paths = uniq(sort(candidates))
    if empty(unique_paths)
        echo 'No valid paths found in config file'
        return
    endif

    let choices = ['Select base path:']
    call extend(choices, map(copy(unique_paths), {idx, val -> (idx+1).'. '.val}))

    let selected = inputlist(choices)
    if selected < 1 || selected > len(unique_paths)
        echo 'Cancelled'
        return
    endif

    call s:SetBasePath(unique_paths[selected-1])
endfunction

" short key and command ======================================
command! -nargs=? -complete=dir SetBasePath call s:SetBasePath(<q-args>)
command! LastResult if filereadable(g:last_search_file) | execute 'vsplit ' . g:last_search_file | endif

nnoremap <leader>bp :SetBasePath 
nnoremap <silent> <leader>bl :call <SID>SelectBasePathFromConfig()<CR>
nnoremap <silent> <leader>ff :call <SID>SearchFiles(input('文件/目录正则: '))<CR>
nnoremap <silent> <leader>fg :call <SID>GrepContent(input('内容正则 文件正则: '))<CR>
nnoremap <leader>fl :execute "source " . g:hgj_path_finder_current_file<CR>
"
nnoremap <leader>bm :execute 'rightbelow vsplit ' .  fnameescape(get(readfile(expand('~/.vim/tmp.txt'), 0, 1), 0, ''))<CR>

