# interactive shells stuff

# rvm settings
#unset RUBYOPT
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
if [[ -s $HOME/.rvm/scripts/rvm ]] then
  if [[ -e /etc/gentoo-release ]] then
    unset RUBYOPT; # gentoo hack
  fi
  . $HOME/.rvm/scripts/rvm
fi

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# keychain
if [ -x  /usr/bin/keychain ] ; then
        cd ~/.ssh/ ; 
	CHAIN="" ;
	for TMP in `ls -f *|grep -v -E "*pub"` ; do
		if [ -f $TMP -a -f $TMP.pub ] ; then
			CHAIN="${CHAIN} $TMP" ;
			keychain -q  $TMP
		fi
	done
	cd -
	#. ~/.keychain/${HOSTNAME}-sh
	. ~/.keychain/${HOST}-sh
fi

