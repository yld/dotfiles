if [[ -d ~/.pyenv/bin ]] ; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init --no-rehash -)"
fi

