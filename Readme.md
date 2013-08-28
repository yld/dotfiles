This repository contains a few dotfiles for the tools i use to wotk with.

# Included configurations
## Zsh

Far from perfect but very usefull, (pretty prompt, VCS (mostly git) integration ...).

Rely partially on completion files provided by distributions.

## Vim

* A few plugins bundled with vundle (see plugins related docs once installed)
* Try F2, F3, F4 while editing for a few usefull mapping.
* Somme tricks from Andrew Neil's book (%% andso on)
...

## Awesome

My Awesome WM setup essentially missing network automatic setup.

## Others files

Settings for RVM and Ruby world tools.

# Tools recommanded and used

* urxvt-unicode
* most a colored pager
* grc for colored output with ping, gcc, netstat (...)
* tmux for terminal multiplexing (actuially missing powerline)
* if you use a Linux do not omit lsb_release package for distro detection

# Installation

Try
curl -L https://github.com/yld/dotfiles/raw/master/bin/dotfiles_init | bash -c

It'll create for you a Src/dotfiles direcrtory, a dotfiles alias, and install all the files. beware of potential conflict.

# Status

Widely tested on Debian family and Gentoo

Correction and suggestions welcome.
