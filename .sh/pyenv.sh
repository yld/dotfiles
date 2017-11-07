if [[ -d ~/.pyenv/bin ]] ; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

