
if [[ -r /etc/gentoo-release ]] ; then

elif [[ -r /etc/debian-release ]]; then

fi

### exports ###
test -r ~/.sh/exports && source ~/.sh/exports

if [[ -x /usr/bin/lesspipe.sh ]] ; then
  export LESSOPEN="|lesspipe.sh %s"
elif [[ -x /usr/bin/lesspipe ]] ; then
  export LESSOPEN="|lesspipe %s"
fi

. ~/.sh/exports

unsetopt auto_name_dirs
# rvm settings
if [[ -s ~/.rvm/scripts/rvm ]] then
  if [[ -e /etc/gentoo-release ]] then
    unset RUBYOPT; # gentoo hack
  fi
  . ~/.rvm/scripts/rvm
fi

