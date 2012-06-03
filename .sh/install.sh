#!/bin/sh


SH_DIR=/home/`whoami`/sh


function movein ()
{
	if[ $1 -nt $2 ]; then
		ln -s $1 $2
	fi
}

#install ~/bin
cd $SH_DIR/bin ;
for i in `ls *` ;
do
	ln -s $SH_DIR/bin/$i $HOME/bin/$i ;
done ;

#install bash

#install zsh
if [ -x $(which zsh) ]; then
	ln -s $SH_DIR/zshrc $HOME/.zshrc
	cd $SH_DIR/zsh ;
	for i in `ls *` ;
	do

	done ;
fi

#install vim
if [ -x $(which vim) ]; then
	ln -s $SH_DIR/bin/.vimrc $HOME/.vimrc
fi

#install screen
if [ -x $(which screen) ]; then
	ln -s $SH_DIR/screenrc $HOME/.screenrc
fi
