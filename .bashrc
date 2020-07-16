#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
#PS1='\h > '
PS1='\e[36m\][\e[00m\]\e[32m\]\h\e[00m\]\e[33m\]@\e[00m\]\e[34m\]Arch\e[00m\] \e[31m\]\W\e[00m\]\e[36m\]]\e[00m\]\e[35m\]\$\e[00m\] '

# when comand is not finsh do this 
#PS2='> '

# bash powerline-shell
#function _update_ps1() {
#    PS1=$(powerline-shell $?)
#}

#if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
#    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
#fi

# Start neofetch when start ssh or login
neofetch
if [ -f ~/.bash_aliases ]; then
 . ~/.bash_aliases
fi
if [ -f ~/.exportrc ]; then
 . ~/.exportrc
fi
