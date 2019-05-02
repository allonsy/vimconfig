
function GetStartingFile()
    return argv()[0]
endfunction

function GetSavePath(pathname)
    let full_path = fnamemodify(a:pathname, ":p")
    let escaped_path = substitute(full_path, "\/", "\\&", "g")
    let save_path = fnameescape("~/.vim/sessions/" . escaped_path)
    return save_path
endfunction

function LoadSession(pathname)
    let session_location = a:pathname
    if filereadable(expand(session_location))
        execute "source" session_location
    endif
endfunction

function ProcessStartingDirectory()
    let start_dir = GetStartingFile()
    if isdirectory(start_dir)
        execute 'cd' fnameescape(start_dir)
        let save_path = GetSavePath(start_dir)
        call LoadSession(save_path)
    endif
endfunction

function Detach()
    let start_dir = GetStartingFile()
    if isdirectory(start_dir)
        let save_path = GetSavePath(start_dir)
        execute "mks!" save_path
        execute "qa"
    endif
endfunction
