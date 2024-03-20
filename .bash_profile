# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[[ -f ~/.bashrc ]] && . ~/.bashrc


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/yves/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
source /Users/yves/.docker/init-bash.sh || true # Added by Docker Desktop
export PATH=$PATH:$HOME/.maestro/bin
