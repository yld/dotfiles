# interactive shells stuff


# keychain
if [ -x  /usr/bin/keychain ] ; then
  #local OLD_DIR=$(pwd)
  #cd ~/.ssh/ ;
	local CHAIN="" ;
  if [[ -d ~/.ssh ]];
  then
    for TMP_PATH in $(ls -A ~/.ssh/ &> /dev/null |grep -E  '(r|d)sa' |grep -v -E "*pub") ;
    do
      TMP_KEY=$(readlink -f $TMP)
      if [ -f $TMP_KEY -a -f ${TMP_KEY}.pub ] ; then
        CHAIN="${CHAIN} $TMP__KEY" ;
        keychain -q  $TMP_KEY
      fi
    done
  fi
  #cd $OLD_DIR ;
	#cd -  2>&1 > /dev/null
	[[ -f ~/.keychain/${HOST}-sh ]] && . ~/.keychain/${HOST}-sh
fi

