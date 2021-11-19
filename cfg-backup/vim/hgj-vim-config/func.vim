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

