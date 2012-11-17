
if [[ -r /etc/gentoo-release ]] ; then

elif [[ -r /etc/debian-release ]]; then

fi

### exports ###
. ~/.sh/exports

#unsetopt auto_name_dirs
# rvm settings
#if [[ -s ~/.rvm/scripts/rvm ]] then
#  if [[ -e /etc/gentoo-release ]] then
#    unset RUBYOPT; # gentoo hack
#  fi
#  . ~/.rvm/scripts/rvm
#fi


#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
