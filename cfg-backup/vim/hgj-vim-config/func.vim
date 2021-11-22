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
        let file_name_suffix = ".c++"
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
