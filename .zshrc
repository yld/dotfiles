
### options ###

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


### completion ###
setopt ALWAYS_TO_END
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_NAME_DIRS
setopt AUTO_PARAM_SLASH
setopt AUTO_REMOVE_SLASH
setopt CHASE_LINKS
setopt COMPLETE_IN_WORD
setopt CORRECT
setopt CORRECT_ALL
setopt EXTENDED_GLOB
setopt GLOB_DOTS
setopt HASH_LIST_ALL
setopt MENU_COMPLETE
setopt NOGLOBDOTS
#FUNCTION_ARGZERO

#setopt VI
#setopt XTRACE

### prompt ###
setopt PROMPT_BANG
setopt PROMPT_PERCENT
setopt PROMPT_SUBST

# aliases
test -r ~/.sh/aliases && source ~/.sh/aliases

# zsh specific aliases
alias -g L='|less '
alias -g G='|grep '
alias suzsh='su -p -s /bin/zsh'

#alias screen='nohup screen'
alias mkdir='nocorrect mkdir'
alias touch='nocorrect touch'

if [[ -r /etc/gentoo-release ]] ; then

elif [[ -r /etc/debian-release ]]; then
  . ~/.sh/aliases.debian
fi

ZLS_COLORS=$LS_COLORS


autoload -U promptinit
promptinit;

# hosts completion
local _myhosts
_myhosts=( ${${${${(f)"$(<$HOME/.ssh/known_hosts)"}:#[0-9]*}%%\ *}%%,*} )
zstyle ':completion:*' hosts $_myhosts

cdpath=(.. ~)
watch=(notme)
LOGCHECK=120
WATCHFMT='%n %a %l from %m at %t.'

# rvm completion
fpath=(~/.zsh/Completion $fpath)
#[[ -r ./.rvmrc ]] && source ./.rvmrc

# customs functions
. ~/.sh/functions.zsh

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' max-errors 2 numeric
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/yves/.zshrc'

autoload -Uz compinit
compinit -u
# End of lines added by compinstall

autoload -U colors && colors

# home, end & Co
bindkey "\e[H" beginning-of-line # Début
bindkey "\e[F" end-of-line # Fin
bindkey "\e[3~" delete-char
bindkey "^R" history-incremental-search-backward # Rechercher

# vcs
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable bzr cvs git svn
zstyle ':vcs_info:git' get-revision true
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr $'%{\e[0;33m%}●%{\e[0m%}'
zstyle ':vcs_info:*' unstagedstr $'%{\e[0;31m%}◼%{\e[0m%}'
#zstyle ':vcs_info:git*' formats "(%s) %i %c%u %b%m"
zstyle ':vcs_info:git*' formats "%{$fg_bold[black]%}(%s)%{$reset_color%} %b %{$fg[yellow]%}[%r] %{$fg[magenta]%}/%S%{$reset_color%} %m%c%u"
zstyle ':vcs_info:*' branchformat '[%b:%r]' # bzr, svn, svk and hg
zstyle ':vcs_info:git*' actionformats "(%s|%{$fg[white]%}%a%{$fg_bold[black]%}) %12.12i %c%u %b%m"
zstyle ':vcs_info:git*+set-message:*' hooks git-st git-stash
#git-untracked

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

        hook_com[branch]="${hook_com[branch]} [${remote} ${(j:/:)gitstatus}]"
    fi
}

function +vi-git-untracked() {
    local untracked

    #check if there's at least 1 untracked file
    untracked=${$(git ls-files --exclude-standard --others | head -n 1)}

    if [[ -n ${untracked} ]] ; then
        hook_com[unstaged]="${hook_com[unstaged]}${yellow}?${gray}"
    fi
}

#PROMPT=$'%h %{\e[1;34m%}%n@%m %{\e[0;35m%} %~%{\e[0m%} %# '

# prompt
precmd() {
  vcs_info
  PS1=$''
  if [[ -n ${vcs_info_msg_0_} ]] then
    PS1=$PS1$'${vcs_info_msg_0_}
'
  fi
  PS1=$PS1$'%h %(!.%{\e[0;31m%}%n@%m%{\e[0m%}.%{\e[1;34m%}%n@%m%{\e[0m%}) %{\e[0;35m%}%~%{\e[0m%} %{\e[30;41m%}%0(?..%?)%{\e[0m%}%{\e[30;43m%}%1(j.%j.)%{\e[0m%}# '
  # %j = jobs
  # %? == $?
  #RPS1=$'${vcs_info_msg_0_}'
}



