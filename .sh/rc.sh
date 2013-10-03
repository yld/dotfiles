# interactive shells stuff

# keychain
if [ -x  /usr/bin/keychain ] ; then
  if [[ -d ~/.ssh ]];
  then
    for TMP_PATH in $(ls -A ~/.ssh/ &> /dev/null |grep -E  '(r|d)sa' |grep -v -E "*pub") ;
    do
      KEY_PATH=~/.ssh/${TMP_PATH}
      [[ -f $KEY_PATH ]] && [[ -f ${KEY_PATH}.pub ]] &&  keychain  -q $TMP_PATH
    done
  fi
	[[ -f ~/.keychain/${HOST}-sh ]] && . ~/.keychain/${HOST}-sh
fi
