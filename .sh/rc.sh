# interactive shells stuff

# keychain
if [ -x  /usr/bin/keychain ] ; then
        cd ~/.ssh/ ; 
	CHAIN="" ;
	for TMP in `ls -f *|grep -v -E "*pub"` ; do
		if [ -f $TMP -a -f $TMP.pub ] ; then
			CHAIN="${CHAIN} $TMP" ;
			keychain  $TMP
		fi
	done
	cd -
	#. ~/.keychain/${HOSTNAME}-sh
	. ~/.keychain/${HOST}-sh
fi

