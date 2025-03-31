" ==============================
" Directory Bookmark Plugin v1.8
" ==============================
" Features:
" 1. \ba 添加书签
" 2. \bl 列表跳转
" 3. \bs 编辑书签
" 4. \bt 注释搜索+自动跳转
" 5. 兼容Vim 7.4+

" 配置变量
if !exists('g:bookmark_file')
    let g:bookmark_file = expand('~/.vim_bookmarks')
endif

" 快捷键映射
let s:keys = {
    \ 'add':    get(g:, 'bookmark_key_add',    '<Leader>ba'),
    \ 'list':   get(g:, 'bookmark_key_list',   '<Leader>bl'),
    \ 'edit':   get(g:, 'bookmark_key_edit',   '<Leader>bs'),
    \ 'search': get(g:, 'bookmark_key_search', '<Leader>bt')
\ }

" 书签加载（带缓存）
let s:bookmark_cache = {}
function! s:LoadBookmarks() abort
    if !empty(s:bookmark_cache) | return s:bookmark_cache | endif
    
    if filereadable(g:bookmark_file)
        for line in readfile(g:bookmark_file)
            let kv = split(line, "\t")
            if len(kv) > 1 | let s:bookmark_cache[kv[0]] = kv[1] | endif
        endfor
    endif
    return s:bookmark_cache
endfunction

" 添加书签
function! bookmark#Add() abort
    let name = input('Bookmark name: ', fnamemodify(getcwd(), ':t'))
    if !empty(name)
        call writefile([name . "\t" . getcwd()], g:bookmark_file, 'a')
        let s:bookmark_cache[name] = getcwd() " 更新缓存
        echo 'Added: ' . name
    endif
endfunction

" 列表跳转
function! bookmark#List() abort
    let bm = s:LoadBookmarks()
    if empty(bm) | echo "No bookmarks!" | return | endif

    let list = map(items(bm), {k,v -> printf('%2d. %-15s → %s', k+1, v[0], v[1])})
    call insert(list, 'Select bookmark:')
    let choice = inputlist(list)
    
    if choice > 0 && choice <= len(bm)
        execute 'cd ' . fnameescape(values(bm)[choice-1])
    endif
endfunction

" 编辑书签
function! bookmark#Edit() abort
    if !filereadable(g:bookmark_file) | call writefile([], g:bookmark_file) | endif
    execute 'tabedit ' . fnameescape(g:bookmark_file) | normal! gg
endfunction

" 智能搜索跳转
function! bookmark#Search() abort
    let pattern = input('Search comment: ')
    if empty(pattern) | return | endif

    " 准备搜索环境
    call s:SetupSearchEnv()

    " 执行搜索流程
    let regex = s:BuildSearchRegex(pattern)
    if has('timers') && has('lambda')
        call timer_start(50, {-> s:ExecuteSearch(regex)})
    else
        call s:ExecuteSearch(regex)
    endif
endfunction

function! s:SetupSearchEnv() abort
    if expand('%:p') !=# expand(g:bookmark_file)
        execute 'tabedit ' . fnameescape(g:bookmark_file)
    endif
    setlocal hlsearch
    silent! normal! gg0
endfunction

function! s:BuildSearchRegex(pattern) abort
    let escaped = substitute(escape(a:pattern, '\/*#'), '\n', '\\n', 'g')
    return '\v^\s*%(\/\/|#).*' . escaped
endfunction

"function! s:ExecuteSearch(regex) abort
"    try
"        " 第一步：定位注释行
"        if !search(a:regex, 'sWc') | echo "Pattern not found" | return | endif
"
"        " 第二步：查找下方书签
"        let target = search('^\S\+\t*\s*\S\+', 'nW')
"        if !target || target <= line('.')
"            echo "No bookmark below" | return
"        endif
"
"        " 第三步：精准跳转
"        execute target . 'G'
"        if search('\t', 'c', line('.')) > 0
"            normal! l
"            redraw
"            echo "Jumped to: " . getline('.')[col('.')-1:]
"        endif
"    catch
"        echo "Search error: " . v:exception
"    endtry
"endfunction

function! s:ExecuteSearch(regex) abort
    try
        " 第一步：定位注释行（保持光标在匹配行）
        if !search(a:regex, 'sWc') 
            echo "Pattern not found"
            return 
        endif
        let comment_line = line('.')  " 记录注释行位置

        " 第二步：向下查找首个书签行
        let found = search('^\S\+\s\+\S\+', 'W', comment_line + 100)  " 限制搜索范围
        if !found || found <= comment_line
            echo "No bookmark entry below"
            return
        endif

        " 第三步：精确定位路径字段
        call cursor(found, 1)  " 确保光标在目标行首
        normal! W  " 移动到路径起始位置
        "if search('\t', 'c', found)  " 在当前行查找制表符
        "    normal! l  " 移动到路径起始位置
        "    redraw
        "    echo "Jumped to: " . expand('<cword>')
        "else
        "    echo "Invalid bookmark format"
        "endif

    catch /E/
        echo "Search error: " . v:exception
    endtry
endfunction

" 注册快捷键
execute 'nnoremap <silent>' . s:keys.add    . ' :call bookmark#Add()<CR>'
execute 'nnoremap <silent>' . s:keys.list   . ' :call bookmark#List()<CR>'
execute 'nnoremap <silent>' . s:keys.edit   . ' :call bookmark#Edit()<CR>'
execute 'nnoremap <silent>' . s:keys.search . ' :call bookmark#Search()<CR>'

