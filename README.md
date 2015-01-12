# vim-go-fmt-on-save

Just the parts of [vim-go][v] that run [goimports][i] on save.

[v]: https://github.com/fatih/vim-go

# Installation

* If you wish to use it, install [goimports][i].
* Clone this repository and copy its contents into `~/.vim`. That should
    put files in `~/.vim/{ftdetect,plugin,autoload/go}`.
* If goimports is slow for you (likely if you don't have an SSD), you may
    to change `go#fmt#Format(1)` to `go#fmt#Format(-1)` (change 1 to -1)
    in `plugin/go.vim`. That will gofmt instead.

[i]: https://godoc.org/golang.org/x/tools/cmd/goimports

# Creation

I created this by copying `autoload/go/fmt.vim`, `autoload/go/tool.vim`, and
`ftdetect/gofiletype.vim`, and then taking the functions from IsWin through
GetBinPath (in other words, the latter and all its dependencies) from
`plugin/go.vim`. At the end of that file, I added just the if statement
that installs the autocmd to call go#fmt#Format and changed the argument
from -1 to 1.

# Rationale

I like my tools minimal and my plugins small and specific to one feature.
