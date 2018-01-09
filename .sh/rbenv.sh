if [[ -d ~/.rbenv/bin ]] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init --no-rehash -)"
fi

