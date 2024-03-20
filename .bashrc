# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi


[ -f ~/.fzf.bash ] && source ~/.fzf.bash


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/yves/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
source /Users/yves/.docker/init-bash.sh || true # Added by Docker Desktop
