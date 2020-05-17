#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]];then
	exec startx
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
export PATH=$PATH:~/.platformio/penv/bin

# Powline-shell for bash
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

# Load aliases
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# Start neofetch when start ssh or login
neofetch