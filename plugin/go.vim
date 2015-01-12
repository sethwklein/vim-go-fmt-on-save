" IsWin returns 1 if current OS is Windows or 0 otherwise
function! IsWin()
    let win = ['win16', 'win32', 'win32unix', 'win64', 'win95']
    for w in win
        if (has(w))
            return 1
        endif
    endfor

    return 0
endfunction

" PathSep returns the appropriate path separator based on OS.
function! PathSep()
    if IsWin()
        return ";"
    endif

    return ":"
endfunction

" DefaultGoPath returns the default GOPATH.
" If there is only one GOPATH it returns that, otherwise it returns the first one.
function! DefaultGoPath()
    let go_paths = split($GOPATH, PathSep())

    if len(go_paths) == 1
        return $GOPATH
    endif

    return go_paths[0]
endfunction

" GetBinPath returns the binary path of installed go tools
function! GetBinPath()
    let bin_path = ""

    " check if our global custom path is set, if not check if $GOBIN is set so
    " we can use it, otherwise use $GOPATH + '/bin'
    if exists("g:go_bin_path")
        let bin_path = g:go_bin_path
    elseif $GOBIN != ""
        let bin_path = $GOBIN
    elseif $GOPATH != ""
        let bin_path = expand(DefaultGoPath() . "/bin/")
    else
        " could not find anything
    endif

    return bin_path
endfunction

if get(g:, "go_fmt_autosave", 1)
    " passing 1 makes it use goimports
    autocmd BufWritePre *.go call go#fmt#Format(1)
endif
