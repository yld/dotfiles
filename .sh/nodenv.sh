if [[ -d ~/.nodenv/bin ]] ; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi


