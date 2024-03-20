# brew loading
eval "$(/opt/homebrew/bin/brew shellenv)"

# overrride system exports
source ~/.sh/exports

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
