# interactive shells stuff


# keychain
if [ -x  /usr/bin/keychain ] ; then
  #local OLD_DIR=$(pwd)
  #cd ~/.ssh/ ; 
	local CHAIN="" ;
  for TMP in `ls -f ~/.ssh/*|grep -E  '(r|d)sa' |grep -v -E "*pub"` ; do
		if [ -f $TMP -a -f $TMP.pub ] ; then
			CHAIN="${CHAIN} $TMP" ;
			keychain -q  $TMP
		fi
	done
  #cd $OLD_DIR ;
	#cd -  2>&1 > /dev/null
	[[ -f ~/.keychain/${HOST}-sh ]] && . ~/.keychain/${HOST}-sh
fi

