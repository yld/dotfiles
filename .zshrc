#set -xv

### options ###
setopt POSIX_BUILTINS
setopt POSIX_ALIASES
### ZSH features
setopt NOTIFY
setopt ZLE

## history ##
setopt SHARE_HISTORY
HISTFILE=~/.zhistory
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY
setopt HIST_BEEP
setopt HIST_FIND_NO_DUPS
HISTSIZE=1000
SAVEHIST=1000

### stack ###
DIRSTACKSIZE=50
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_TO_HOME
setopt PUSHD_IGNORE_DUPS
setopt LIST_BEEP
#setopt NO_LIST_BEEP
setopt MARK_DIRS

# job control
setopt CHECK_JOBS
setopt HUP
setopt NOTIFY

## auto correct ##
setopt CORRECT
setopt CORRECT_ALL
CORRECT_IGNORE='rspec'

## completion ##
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_NAME_DIRS
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
setopt CHASE_LINKS
setopt COMPLETE_IN_WORD
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt HASH_LIST_ALL
setopt MENU_COMPLETE
setopt NOGLOBDOTS
#FUNCTION_ARGZERO

#setopt VI
#setopt XTRACE

zmodload zsh/zutil

# zsh only aliases
alias -g ls='ls --color=auto'
alias -g less='less -F -i -S -w -X -R'
alias -g grep='grep --color=always'
alias -g fgrep='fgrep --color=always'
alias -g egrep='egrep --color=always'

autoload -U zmv
alias mmv='noglob zmv -W'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -L'
alias zmv='noglob zmv'

alias mkdir='nocorrect mkdir'
alias 'svn mkdir'='nocorrect svn mkdir'
alias touch='nocorrect touch'
alias mv='nocorrect mv'

alias -g L=' | less -R'
alias -s log='less'

alias -g G=' | grep --color=always'
alias -g H=' | head '
alias -g M=' | most '
alias -g P=" | $PAGER "
alias -g T=' | tail'
# end zsh only aliases

# common aliases
[[ -x $(command -v grc) ]] && . ~/.zsh/grc.zsh
test -r ~/.sh/aliases && source ~/.sh/aliases

alias suzsh='su -m -s /bin/zsh -- -u -i'


# help stuff
export HELPDIR=~/.zsh_help
if [[ ! -d $HELPDIR ]]; then
  mkdir $HELPDIR ;
  cd $HELPDIR
  perl /usr/share/zsh/${ZSH_VERSION}/Util/helpfiles zshbuiltins .
fi

autoload -U run-help
autoload run-help-openssl
autoload run-help-git
autoload run-help-svn
autoload run-help-sudo
unalias run-help
alias help='run-help'
# end help stuff


# https://github.com/unixorn/awesome-zsh-plugins
. ~/.zplugd/init.zsh
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
export NVM_AUTO_USE=true
export NVM_LAZY_LOAD=true
zplug "lukechilds/zsh-nvm"
zplug "voronkovich/gitignore.plugin.zsh"
zplug "unixorn/git-extra-commands"
zplug "RobertAudi/tsm"
zplug "plugins/yarn", from:oh-my-zsh
# zplug "johnhamelink/rvm-zsh"
zplug check || (zplug install && zplug update)
zplug load

autoload -U pick-web-browser
zstyle ':mime:*' x-browsers konqueror firefox links2
alias -s html=pick-web-browser

# recent directories
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*:*:cdr:*:*' menu selection
# end recent directories

ZLS_COLORS=$LS_COLORS

autoload -U promptinit
promptinit;

### ssh hosts completion
if [[ -r $HOME/.ssh/known_hosts ]];
then
  local _myhosts
  _myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
  zstyle ':completion:*' hosts $_myhosts
fi
### end ssh hosts completion

cdpath=(.. ~)
watch=(notme)
LOGCHECK=120
WATCHFMT='%n %a %l from %m at %t.'

# customs functions
. ~/.sh/functions.zsh
. ~/.zsh/functions.d/*

### completion
fpath=(~/.zsh/completion.d $fpath)

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' use-compctl true
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*' squeeze-slashes true

zstyle :compinstall filename '/home/yves/.zshrc'

autoload -Uz compinit
autoload -U +X bashcompinit && bashcompinit
compinit -u
# End of lines added by compinstall

### end completion

autoload -U colors && colors

# home, end & Co key bindings
# konsole
bindkey "\e[H" beginning-of-line # Début
bindkey "\e[F" end-of-line # Fin
bindkey "\e[3~" delete-char
bindkey "^R" history-incremental-search-backward # Rechercher
# urxvt
bindkey "^[[7~" beginning-of-line # Début
bindkey "^[[8~" end-of-line # Fin
bindkey "^[[3~" delete-char
#gnome terminal
bindkey "^[OF" end-of-line
bindkey "^[OH" beginning-of-line

# vcs
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable cvs git svn
zstyle ':vcs_info:*' max-exports 1
zstyle ':vcs_info:git' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr $'%{\e[0;33m%}●%{\e[0m%}'
zstyle ':vcs_info:*' unstagedstr $'%{\e[0;31m%}◼%{\e[0m%}'
zstyle ':vcs_info:git*' formats "%{$fg_bold[black]%}@%s%{$reset_color%} %{$fg_bold[white]%}%r%{$reset_color%}%{$fg_bold[black]%}[%{$fg_bold[blue]%}%b%{$fg_bold[black]%}]%{$reset_color%} %{$fg[magenta]%}%S%{$reset_color%} %m"
zstyle ':vcs_info:*' branchformat '[%b:%r]' # bzr, svn, svk and hg
zstyle ':vcs_info:git*' actionformats "(%s|%{$fg[white]%}%a%{$fg_bold[black]%}) %12.12i %c%u %b%m"
zstyle ':vcs_info:git*+set-message:*' hooks git-st git-untracked git-icons

function +vi-git-icons() {
  local stashes untracked_count staged_count

  if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
    stashes=$(git stash list 2>/dev/null | wc -l)
    hook_com[misc]+="%{$fg[green]%}▲(${stashes})%{$reset_color%} "
  fi
  staged_count=${$(git status -s -uno |wc -l)}
  if [[ $staged_count != "0" ]] ; then
    hook_com[misc]+="%{$fg_bold[yellow]%}●($staged_count)%{$reset_color%}"
  fi
  untracked_count=${$(git ls-files --exclude-standard --others --directory --no-empty-directory | wc -l )}
  if [[ $untracked_count != "0" ]] ; then
    hook_com[misc]+="%{$fg[red]%}◼($untracked_count)%{$reset_color%}"
  fi
}

function +vi-git-stash() {
  local -a stashes

  if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
    stashes=$(git stash list 2>/dev/null | wc -l)
    #hook_com[misc]+="${stashes}▲)"
    hook_com[misc]+="%{$fg[green]%}▲(${stashes})%{$reset_color%}"
  fi
}

function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name --abbrev-ref 2>/dev/null)}

    if [[ -n ${remote} ]] ; then
        # for git prior to 1.7
        # ahead=$(git rev-list origin/${hook_com[branch]}..HEAD | wc -l)
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "${green}+${ahead}${gray}" )

        # for git prior to 1.7
        # behind=$(git rev-list HEAD..origin/${hook_com[branch]} | wc -l)
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${red}-${behind}${gray}" )

        hook_com[branch]="%{$fg_bold[yellow]%}${hook_com[branch]}%{$reset_color%}%{$fg_bold[white]%}|%{$fg_bold[blue]%}${remote}%{$fg_bold[yellow]%}${(j:/:)gitstatus}%{$reset_color%}"
    fi
}

### prompt ###
setopt PROMPT_BANG
setopt PROMPT_PERCENT
#setopt PROMPT_SUBST
precmd() {
  vcs_info
  PS1=$''
  if [[ -n ${vcs_info_msg_0_} ]] then
    PS1=$PS1"${vcs_info_msg_0_}
"
  fi
  PS1=$PS1$'%h %(!.%{\e[0;31m%}%n@%m%{\e[0m%}.%{\e[1;34m%}%n@%m%{\e[0m%}) %{\e[0;35m%}%~%{\e[0m%}%0(?..%{\e[30;41m%}%?%{\e[0m%}) %1(j.%{\e[30;43m%}%j%{\e[0m%}.)# '
}

# colorized stderr
# buggy with su & sudo: do not use
#exec 2>>(
#  while read line; do
#    print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0';
#  done &
#)
# second version
#sm_color_red="$(  tput setaf 1)"
#sm_color_reset="$(tput sgr0   )"
#exec 2>>( awk '{print "'"$sm_color_red"'"$0"'"$sm_color_reset"'"}' >&2 & )
#unset sm_color_reset
#unset sm_color_red
#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)
#exec 2>>( while read X; do print "\e[91m${X}\e[0m" > /dev/tty; done & )
#[[ $hilite = "on" ]] || hilite="on" exec hilite zsh
# end zsh specific stuff

. ~/.sh/rc.sh

# rvm settings
unsetopt auto_name_dirs
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then
  [[ -e /etc/gentoo-release ]]  && unset RUBYOPT; # gentoo hack
fi
