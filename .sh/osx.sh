if [[ $OS = "OSX" ]] ; then
  # brew GNU coreutils
  if [[ -d /usr/local/opt/coreutils/libexec/gnubin ]] ; then
    PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
    MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
  fi
  # brew postgresql 9.6
  if [[ -d /usr/local/opt/postgresql@9.6/bin ]] ; then
    PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
    #LDFLAGS:  -L/usr/local/opt/postgresql@9.6/lib
    #CPPFLAGS: -I/usr/local/opt/postgresql@9.6/include
    #To have launchd start postgresql@9.6 now and restart at login:
    #  brew services start postgresql@9.6
    #Or, if you don't want/need a background service you can just run:
    #  pg_ctl -D /usr/local/var/postgresql@9.6 start
  fi
  if [[ -d /usr/local/opt/gpg-agent/bin ]] ; then
    PATH="/usr/local/opt/gpg-agent/bin:$PATH"
  fi
fi

export PATH
export MANPATH


