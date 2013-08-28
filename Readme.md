This repository contains a few dotfiles for the tools i use to wotk with.

# Included configurations
## [Zsh](http://www.zsh.org/)

Far from perfect but very usefull, (pretty prompt, VCS (mostly git) integration ...).

Rely partially on completion files provided by distributions.

## Vim

* A few plugins bundled with [vundle](https://github.com/gmarik/vundle) (see plugins related docs once installed)
* Try F2, F3, F4 while editing for a few usefull mapping.
* Somme tricks from [Drew Neil](http://vimcasts.org/)'s book (%% andso on)
...

## Awesome

My [Awesome WM] (http://awesome.naquadah.org/) setup essentially missing network automatic setup.

## Others files

Settings for RVM and Ruby world tools.

# Tools recommanded and used

* urxvt-unicode
* [most](http://www.jedsoft.org/most/) a colofull pager
* grc for colored output with ping, gcc, netstat (...)
* [tmux](http://tmux.sourceforge.net/) for terminal multiplexing (actually missing [powerline](https://github.com/Lokaltog/powerline))
* if you use a Linux do not omit lsb_release package for distro detection

# Installation

Run:

curl -L https://github.com/yld/dotfiles/raw/master/bin/dotfiles_init | bash -c

It'll create for you a Src/dotfiles directory, a dotfiles alias, and install all the files.

Beware of potential conflict wirth existning files, or merge them wth vimdiff:  git --git-dir=$HOME/Src/dotfiles.git/ --work-tree=$HOME mergetool -t vimdiff

# Status

Widely tested on Debian family and Gentoo

Correction and suggestions welcome.
