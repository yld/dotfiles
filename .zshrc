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
[[ $OS = "LINUX" ]] && alias -g ls='ls --color=auto'
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

test -x $(command -v ag) && alias -g A=' |ag '
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


# zplug begin
# https://github.com/unixorn/awesome-zsh-plugins
. ~/.zplugd/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "voronkovich/gitignore.plugin.zsh"
zplug "unixorn/git-extra-commands"
zplug "RobertAudi/tsm"
# zplug "joel-porquet/zsh-dircolors-solarized"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "plugins/yarn", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/codeclimate", from:oh-my-zsh
zplug "supercrabtree/k"
zplug "djui/alias-tips"
zplug "raylee/tldr", as:command, use:tldr
zplug "tj/burl", as:command, rename-to:burl, use:"*bin/burl"
zplug "rupa/z", use:"*.sh"
zplug "gusaiani/elixir-oh-my-zsh"
zplug "johanhaleby/kubetail", as:command, use:'kubetail'
zplug "superbrothers/zsh-kubectl-prompt", use:"kubectl.zsh"
zplug "FinalCAD/devops_tools", as:command, use:"dheroku/dheroku.sh", rename-to:dheroku
zplug "FinalCAD/devops_tools", as:command, use:"manage-aws-env/manage-aws-env", rename-to:manage-aws-env
zplug "zchee/zsh-completions", use:'src/go/_go'
# zplug "FinalCAD/devops_tools", as:command, use:"{manage-aws-env/manage-aws-env,rotate_aws_credentials/rotate_aws_credentials,switch_aws_profile/switch_aws_profile,switch_aws_profile/switch_aws_profile,switch_kube_context/switch_kube_context}"
# zplug "FinalCAD/devops_tools", as:command, use:"rotate_aws_credentials/rotate_aws_credentials"
# zplug "FinalCAD/devops_tools", as:command, use:"switch_aws_profile/switch_aws_profile"
# zplug "FinalCAD/devops_tools", as:command, use:"switch_kube_context/switch_kube_context"
# zplug "yld/bc684e4de94a8d830e04c0db13ca7814", from:gist, as:command, use:'dheroku.sh', rename-to:'dheroku'
# zplug "plugins/mix", from:oh-my-zsh
zplug check || (zplug install && zplug update)
zplug load

export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias tip: "

# burl aliases
alias GET='burl GET'
alias HEAD='burl -I'
alias POST='burl POST'
alias PUT='burl PUT'
alias PATCH='burl PATCH'
alias DELETE='burl DELETE'
alias OPTIONS='burl OPTIONS'
export PATH="$PATH:$ZPLUG_BIN"
# zplug end

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

# https://gist.github.com/ctechols/ca1035271ad134841284
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C
# End of lines added by compinstall

[[ -x $(command -v kops) ]] && source <(kops completion zsh)
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
# zstyle ':vcs_info:*' stagedstr $'%{\e[0;33m%}●%{\e[0m%}'
# zstyle ':vcs_info:*' unstagedstr $'%{\e[0;31m%}◼%{\e[0m%}'
zstyle ':vcs_info:git*' formats "%{$fg_bold[orange]%}%s %{$reset_color%}%{$fg_bold[white]%}%r%{$reset_color%}%{$fg_bold[yellow]%}[%{$fg_bold[blue]%}%b%{$fg_bold[yellow]%}]%{$reset_color%} %{$fg[magenta]%}%S%{$reset_color%} %m"
zstyle ':vcs_info:*' branchformat '(%b:%r)' # bzr, svn, svk and hg
zstyle ':vcs_info:git*' actionformats "(%s|%{$fg[white]%}(%a)%{$fg_bold[black]%}) %12.12i %c%u %b%m"
zstyle ':vcs_info:git*+set-message:*' hooks git-st git-untracked git-icons

function +vi-git-icons() {
  local stashes untracked_count staged_count

  if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
    stashes=$(git stash list 2>/dev/null | wc -l)
    hook_com[misc]+="%{$fg[yellow]%}●(${stashes})%{$reset_color%} "
  fi
  staged_count=${$(git status -s -uno |wc -l)}
  if [[ $staged_count != "0" ]] ; then
    hook_com[misc]+="%{$fg_bold[green]%}▲($staged_count)%{$reset_color%}"
  fi
  untracked_count=${$(git ls-files --exclude-standard --others --directory --no-empty-directory | wc -l )}
  if [[ $untracked_count != "0" ]] ; then
    hook_com[misc]+=" %{$fg[red]%}◼($untracked_count)%{$reset_color%}"
  fi
}

function +vi-git-st() {
    local ahead behind remote
    local -a gitstatus

    # Are we on a remote-tracking branch?
    remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} \
        --symbolic-full-name --abbrev-ref 2>/dev/null)}

    if [[ -n ${remote} ]] ; then
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        (( $ahead )) && gitstatus+=( "${green}+${ahead}${gray}" )
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)
        (( $behind )) && gitstatus+=( "${red}-${behind}${gray}" )
        hook_com[branch]="%{$fg_bold[yellow]%}${hook_com[branch]}%{$reset_color%}%{$fg_bold[white]%}:%{$fg_bold[blue]%}${remote}%{$fg_bold[yellow]%}${gitstatus}%{$reset_color%}"
    fi
}

# kubectl prompt
autoload -U colors; colors
# function kube_prompt() {
#   local KUBE_CURRENT_CONTEXT=$(kubectl  config current-context)
#   local KUBE_CURRENT_NAMESPACE=$(kubectl config view --minify --output 'jsonpath={..namespace}')
# 	KUBE_PROMPT="%B"$'\u2388'"%b %F{red}$(echo $KUBE_CURRENT_CONTEXT | cut -d '/' -f 2 | sed 's/eks-//g')%f:%F{blue}${KUBE_CURRENT_NAMESPACE}%f"
# }
# if [[ -f /usr/local/opt/kube-ps1/share/kube-ps1.sh ]]
# then
#   KUBE_PROMPT=$(kubectl  config current-context)
#   function get_cluster_short() {
#     echo "$1" | cut -d '/' -f 2 | sed 's/eks-//g'
#   }
#   KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short
#   # KUBE_PS1_SYMBOL_ENABLE=false
#   KUBE_PS1_SYMBOL_USE_IMG=true

#   source /usr/local/opt/kube-ps1/share/kube-ps1.sh
#   KUBE_PROMPT='$(kube_ps1)'
# fi

#$RPROMPT

### prompt ###
setopt PROMPT_BANG
setopt PROMPT_PERCENT
#setopt PROMPT_SUBST
precmd() {
  vcs_info
	# kube_prompt
  PS1=$''
  if [[ -n ${KUBE_PROMPT} ]] then
    PS1=$PS1"${KUBE_PROMPT}
"
  fi
  if [[ -n ${vcs_info_msg_0_} ]] then
    PS1=$PS1"${vcs_info_msg_0_}
"
  fi
  PS1=$PS1$'%h %(!.%{\e[0;31m%}%n@%m%{\e[0m%}.%{\e[1;61m%}%n@%m%{\e[0m%}) %{\e[0;35m%}%~%{\e[0m%}%0(?..%{ \e[30;41m%}%?%{\e[0m%}) %1(j.%{\e[30;43m%}%j%{\e[0m%}.)%# '
}

# colorized stderr
# buggy with su & sudo so drop it for root
# if [[ $UID != 0 && $EUID != 0 ]]; then
# 	exec 2>>(
# 		while read line; do
# 			print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0';
# 		done &
# 	)
# fi


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

source ~/.sh/rc.sh

source ~/.sh/osx.sh
source ~/.sh/keychain.sh
source ~/.sh/iterm2_shell_integration.zsh

# asdf
source ~/.asdf/asdf.sh
source ~/.asdf/completions/asdf.bash

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# added by travis gem
[ -f /Users/yves/.travis/travis.sh ] && source /Users/yves/.travis/travis.sh

complete -o nospace -C /Users/yves/.asdf/installs/terraform/$(asdf current terraform | cut -f1 -d ' ')/bin/terraform terraform

