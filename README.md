# vim-go-fmt-on-save

Just the parts of vim-go that run goimports on save.

# Installation

* Install goimports.
* Clone this repository and copy its contents into `~/.vim`. That should
    put files in `~/.vim/{ftdetect,plugin,autoload/go}`.

# Creation

I created this by copying `autoload/go/fmt.vim`, `autoload/go/tool.vim`, and
`ftdetect/gofiletype.vim`, and then taking the functions from IsWin through
GetBinPath (in other words, the latter and all its dependencies) from
`plugin/go.vim`. At the end of that file, I added just the if statement
that installs the autocmd to call go#fmt#Format and changed the argument
from -1 to 1.

# Rationale

I like my tools minimal and my plugins small and specific to one feature.
