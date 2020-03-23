# set -v

# zmodload zsh/zprof

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
# alias -g grep='grep --color=auto'
# alias -g fgrep='fgrep --color=auto'
# alias -g egrep='egrep --color=auto'

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

command -v ag &> /dev/null && alias -g A=' |ag '
alias -g G=' | grep --color=auto'
alias -g H=' | head '
alias -g M=' | most '
alias -g P=" | $PAGER "
alias -g T=' | tail'
alias suzsh='su -m -s /bin/zsh -- -u -i'
# end zsh only aliases

# common aliases
command -v grc &>/dev/null && . ~/.zsh/grc.zsh
source ~/.sh/aliases



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

# hack, see https://github.com/zplug/zplug/issues/420

# OLD_LANG=$LANG
# OLD_LC_ALL=$LC_ALL
export LC_ALL=en_US.UTF-8 && export LANG=en_US.UTF-8

source ~/.zplugd/init.zsh
touch $ZPLUG_LOADFILE

zplug "zplug/zplug", hook-build:"zplug --self-manage"
[ "$OS" != "LINUX" ] && zplug "plugins/gnu-utils", from:oh-my-zsh, defer:2


zplug "FinalCAD/devops_tools", as:command, use:"dheroku/dheroku.sh", rename-to:dheroku, defer:3
zplug "RobertAudi/tsm"
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "flosell/iam-policy-json-to-terraform" # FIXME, from:gh-r, as:command, rename-to:iam-policy-json-to-terraform
# zplug "ggreer/the_silver_searcher", use:'_the_silver_searcher', defer:2
zplug "git/git", use:"contrib/completion/git-completion.zsh", defer:2
zplug "gusaiani/elixir-oh-my-zsh"
zplug "johanhaleby/kubetail", as:command, use:'kubetail'
zplug "plugins/alias-finder", from:oh-my-zsh, defer:3
zplug "plugins/asdf", from:oh-my-zsh, defer:2
zplug "plugins/autopep8", from:oh-my-zsh, defer:2
zplug "plugins/brew", from:oh-my-zsh, defer:2
zplug "plugins/bundler", from:oh-my-zsh, defer:2
zplug "plugins/codeclimate", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh, defer:2
zplug "plugins/gem", from:oh-my-zsh, defer:2
zplug "plugins/git", from:oh-my-zsh, defer:2
zplug "plugins/gpg-agent", from:oh-my-zsh, defer:2
zplug "plugins/helm", from:oh-my-zsh, defer:2
zplug "plugins/heroku", from:oh-my-zsh, defer:2
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh, defer:2
zplug "plugins/pip", from:oh-my-zsh, defer:2
zplug "plugins/python", from:oh-my-zsh, defer:2
zplug "plugins/rails", from:oh-my-zsh, defer:2
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/zsh_reload", from:oh-my-zsh, defer:3
# zplug "raylee/tldr", as:command, use:tldr
zplug "rupa/z", use:"*.sh"
# zplug "superbrothers/zsh-kubectl-prompt", use:"kubectl.zsh"
# zplug "supercrabtree/k", rename-to:l
zplug "tj/burl", as:command, rename-to:burl, use:"*bin/burl"
zplug "unixorn/git-extra-commands"
zplug "voronkovich/gitignore.plugin.zsh"
zplug "zchee/zsh-completions", use:'src/go/_go'
# zplug "zsh-users/zsh-completions", use:'src/_git-flow', defer:2
# zplug "zsh-users/zsh-completions", use:'src/_golang', defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2

# zplug "yld/bc684e4de94a8d830e04c0db13ca7814", from:gist, as:command, use:'dheroku.sh', rename-to:'dheroku'
# zplug "plugins/mix", from:oh-my-zsh
if ! zplug check --verbose; then
    printf "Install zplug plugins ? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load #--verbose

# zplug check plugins/alias-finder;
export ZSH_ALIAS_FINDER_AUTOMATIC=true
# zplug check djui/alias-tips;
export ZSH_PLUGINS_ALIAS_TIPS_TEXT="Alias: "

# hack, see https://github.com/zplug/zplug/issues/420
# export LC_ALL=$OLD_LC_ALL && export LANG=$OLD_LANG

if [ command -v burl &> /dev/null ] ; then
  # burl aliases
  alias GET='burl GET'
  alias HEAD='burl -I'
  alias POST='burl POST'
  alias PUT='burl PUT'
  alias PATCH='burl PATCH'
  alias DELETE='burl DELETE'
  alias OPTIONS='burl OPTIONS'
  export PATH="$PATH:$ZPLUG_BIN"
fi
# zplug end

autoload -U pick-web-browser
zstyle ':mime:*' x-browsers konqueror firefox chrome links2
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

type brew &>/dev/null && FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
autoload -Uz compinit
autoload -U +X bashcompinit && bashcompinit

# https://gist.github.com/ctechols/ca1035271ad134841284
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

compinit -C
#
# End of lines added by compinstall

command -v kops &> /dev/null && source <(kops completion zsh)
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
zstyle ':vcs_info:*' enable git # cvs svn
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

autoload -U colors; colors
#
### prompt ###
setopt PROMPT_BANG
setopt PROMPT_PERCENT
#setopt PROMPT_SUBST
precmd() {
  vcs_info
	# kube_prompt
  PS1=$''
  # if [[ -n ${KUBE_PROMPT} ]] then
  #   PS1=$PS1"${KUBE_PROMPT}
# "
  # fi
  if [[ -n ${vcs_info_msg_0_} ]] then
    PS1=$PS1"${vcs_info_msg_0_}
"
  fi
  PS1=$PS1$'%h %(!.%{\e[0;31m%}%n@%m%{\e[0m%}.%{\e[1;61m%}%n@%m%{\e[0m%}) %{\e[0;35m%}%~%{\e[0m%}%0(?..%{ \e[30;41m%}%?%{\e[0m%}) %1(j.%{\e[30;43m%}%j%{\e[0m%}.)%# '
}

source ~/.sh/keychain.sh
source ~/.sh/iterm2_shell_integration.zsh

# asdf
# managed by plugin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
command -v "direnv" &> /dev/null && eval "$(direnv hook zsh)"
# added by travis gem
[ -f /Users/yves/.travis/travis.sh ] && source /Users/yves/.travis/travis.sh
source ~/.sh/dotfiles

# zmodload zsh/zprof
source "/Users/yves/Src/swile/lunchr-docker/tools/lunchr.sh"  # This loads lunchr
