# interactive shells stuff

# keychain
if [ -x  /usr/bin/keychain ] ; then
  if [[ -d ~/.ssh ]];
  then
    for TMP in $(ls -A ~/.ssh/ &> /dev/null |grep -E  '(r|d)sa' |grep -v -E "*pub") ;
    do
      KEY_PATH=~/.ssh/${TMP}
      [[ -f $KEY_PATH ]] && [[ -f ${KEY_PATH}.pub ]] &&  keychain  -q $TMP
    done
  fi
	[[ -f ~/.keychain/${HOST}-sh ]] && . ~/.keychain/${HOST}-sh
fi
