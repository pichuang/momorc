# Set the following to make all x terminals have proper PS1 and PS2
# \033[0;30m - Black
# \033[0;31m - Red
# \033[0;32m - Green
# \033[0;33m - Orange
# \033[0;34m - Blue
# \033[0;35m - Cyan
# \033[0;36m - Light Blue
# \033[0;37m - Grey
# \033[0;39m - White

TERM=xterm-256color
PS1='\[\e[1;36m\]\t \[\e[01;33m\]\u\[\e[m\]@\h\[\e[0m\]:\[\e[01;34m\]\w\[\e[0m\] \[\e[0;31m\]$(__git_ps1 "(%s)")\e[0m\]\$'
PATH=${PATH}
EDITOR=vim
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

if [[  `uname` =~ "Linux" ]] ; then
   alias ls='ls --color=auto'
   alias ll='ls -alF'
   alias la='ls -A'
   alias l='ls -CF'
   
   alias pacman='pacman --color=auto'
   alias telnet='bug5 -up telnet -8L -8'
   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
   alias ..='cd .. && ll'
   alias trs='trs {en=zh-TW}'

fi


set meta-flag on
set input-meta on
set convert-meta off
set output-meta on

set filec
set autolist                # tab completing
set autologout=0

[[ -s "$HOME/.inputrc" ]] && export INPUTRC="$HOME/.inputrc"
[[ -s "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases" # Load bash_profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function
[[ -s "$HOME/ENV/bin/activate" ]] && . "$HOME/ENV/bin/activate" # Load virtualenv
[[ -f "/usr/share/bash-completion/bash_completion" ]] && source "/usr/share/bash-completion/bash_completion" #bash-completion

#https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
[[ -f "$HOME/.git-prompt.sh" ]] && . "$HOME/.git-prompt.sh"

if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval `ssh-agent -s`  > /dev/null 2>&1
  ls ~/.ssh/ |grep -vE '(.pub|authorized_keys|known_hosts)'| xargs -i ssh-add ~/.ssh/{}  > /dev/null 2>&1
fi

if [ -n "$SSH_TTY" ] ; then
    echo $SSH_TTY
    [[ -r "$HOME/etc/motd" ]] && cat $HOME/etc/motd
fi

