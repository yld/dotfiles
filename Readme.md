This repository contains a few dotfiles for the tools i use to work with.

# Installation

```bash
curl -L https://github.com/yld/dotfiles/raw/master/bin/dotfiles_init | bash
```

# Upgrade

```bash
dotfiles_init
```

# Included setups

## [Zsh](http://www.zsh.org/)

* Far from perfect but very usefull, (pretty prompt, VCS (mostly git) integration ...).
* Rely partially on completion files provided by distributions.
* Plugins are managed by [Zplug](https://github.com/zplug/zplug)

## [Vim](http://www.vim.org/)

* A few plugins bundled with [vundle](https://github.com/gmarik/vundle) (see plugins related docs once installed)
* Try F2, F3, F4 while editing for a few usefull mapping.
* Somme tricks from [Drew Neil](http://vimcasts.org/)'s book (%% andso on)
* Tmux, screen, Rails, Node, Git, XML tools and parsers included
* [ale](https://github.com/w0rp/ale) for syntax checking

Requires Vim version 8 or above.

## Version managers

* nodenv
* rbenv
* pyenv

## [Awesome WM] (http://awesome.naquadah.org/)

TO BE REMOVED forget it.

## Others files

Settings for Ruby, yarn, node...

To get a list of managed files:
```bash
cd $HOME/Src/dotfiles.git/
git ls-files
```

# Tools recommanded and used

* [urxvt](http://software.schmorp.de/pkg/rxvt-unicode.html)
* [most](http://www.jedsoft.org/most/) a colofull pager (buggy with psql, TO BE REMOVED)
* grc for colored output with ping, gcc, netstat (...)
* [tmux](http://tmux.sourceforge.net/) for terminal multiplexing (actually missing [powerline](https://github.com/Lokaltog/powerline))
* if you use a Linux do not omit lsb_release package for distro detection. ie. you should have a file named /etc/lsb-release

# Status

Widely tested on Debian family and Gentoo

Corrections and suggestions welcome.


# TODO

* Configurable $DOTFILES_DIR
* Remove awesome configuration from here.
* Show untracked files count in git prompt
* modularize zsh & vim confifguration
* profiles for ssh keys and so on (see Vincent Bernat repositories)
