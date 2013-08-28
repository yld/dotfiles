#set -u
#set -x

# interactive shells stuff

# bad but fed up with th lines below
eval ` keychain --eval   /home/ledouaron/.ssh/*sa `

# keychain
#if [ -x  /usr/bin/keychain ] ; then
#	CHAIN="" ;
#  if test -d ~/.ssh ;
#  then
#    for TMP in $(ls -A ~/.ssh/ &> /dev/null |grep -E  '(r|d)sa' |grep -v -E "*pub") ;
#    do
#      TMP=$(readlink -f ~/.ssh/$TMP)
#      if [ -f $TMP -a -f ${TMP}.pub ] ; then
#        CHAIN="${CHAIN} $TMP"
#      fi
#    done
#  fi
#  echo 'eval ` keychain --eval ' $CHAIN '` '
#  eval ` keychain --eval $CHAIN `
#
#  #keychain $CHAIN && source $HOME/.keychain/`uname -n`-sh
#
#fi

