#salias() {
#    emulate -L zsh
#    local only=0 ; local multi=0
#    while [[ $1 == -* ]] ; do
#        case $1 in
#            (-o) only=1 ;;
#            (-a) multi=1 ;;
#            (--) shift ; break ;;
#            (-h)
#                printf 'usage: salias [-h|-o|-a] <alias-expression>\n'
#                printf '  -h      shows this help text.\n'
#                printf '  -a      replace '\'' ; '\'' sequences with '\'' ; sudo '\''.\n'
#                printf '          be careful using this option.\n'
#                printf '  -o      only sets an alias if a preceding sudo would be needed.\n'
#                return 0
#                ;;
#            (*) printf "unkown option: '%s'\n" "$1" ; return 1 ;;
#        esac
#        shift
#    done
#
#    if (( ${#argv} > 1 )) ; then
#        printf 'Too many arguments %s\n' "${#argv}"
#        return 1
#    fi
#
#    key="${1%%\=*}" ;  val="${1#*\=}"
#    if (( EUID == 0 )) && (( only == 0 )); then
#        alias -- "${key}=${val}"
#    elif (( EUID > 0 )) ; then
#        (( multi > 0 )) && val="${val// ; / ; sudo }"
#        alias -- "${key}=sudo ${val}"
#    fi
#
#    return 0
#}

chpwd() {
  [[ -o interactive ]] || return
  case $TERM in
    sun-cmd) print -Pn "\e]l%~\e\\"
      ;;
    screen)
      print -Pn "\ek$a:$3\e\\"      # screen title (in ^A")
    ;;
    *xterm*|*rxvt|(dt|k|E)term|konsole)
      print -Pn "\e]2;%~\a"
      ;;
  esac
}

#preexec() {
#  echo "$1 from preexec"
#}
#function zle-line-init zle-keymap-select {
#  RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#  RPS2=$RPS1
#  zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

# help(){
#     #This function used to call the "bash" builtin.
#     #bash -c "help $@"

#     #Better way: look it up in the man pages. I often look up "test" which doesn't give a usefull result,
#     #so I added that as a special case.
#     if [[ $1 == "test" ]]; then
#         man --pager="less -p'^CONDITIONAL EXPRESSIONS$'" zshall
#     else
#         man --pager="less -p'^ *$@ '" zshall
#     fi
# }
