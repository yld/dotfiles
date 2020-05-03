zplug "zplug/zplug", hook-build:"zplug --self-manage"
[ "$OS" != "LINUX" ] && zplug "plugins/gnu-utils", from:oh-my-zsh, defer:2


zplug "FinalCAD/devops_tools", as:command, use:"dheroku/dheroku.sh", rename-to:dheroku, defer:3
zplug "RobertAudi/tsm"
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "flosell/iam-policy-json-to-terraform" # FIXME, from:gh-r, as:command, rename-to:iam-policy-json-to-terraform
# zplug "ggreer/the_silver_searcher", use:'_the_silver_searcher', defer:2
zplug "git/git", use:"contrib/completion/git-completion.zsh", defer:2
zplug "gusaiani/elixir-oh-my-zsh"
zplug "mafredri/zsh-async", as:command, use:'kubetail'
zplug "johanhaleby/kubetail", use:'async.zsh'
zplug "plugins/alias-finder", from:oh-my-zsh, defer:3
zplug "plugins/asdf", from:oh-my-zsh, defer:2
zplug "plugins/autopep8", from:oh-my-zsh, defer:2
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
zplug "gruntwork-io/fetch", from:gh-r, as:command, rename-to:fetch, use:"*darwin*amd64*"

