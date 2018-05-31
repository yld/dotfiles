# interactive shells stuff

# keychain (ssh & gpg keys)
if [ -x $(command -v keychain) ] ; then
  if [[ -d ~/.ssh ]]; then
    for KEY_PATH in $(ls -A ~/.ssh/*sa &> /dev/null ) ; do
      [[ -f ${KEY_PATH}.pub ]] &&  keychain  -q $TMP_PATH
    done
  fi
	test -f ~/.keychain/${HOST}-sh && . ~/.keychain/${HOST}-sh
fi

