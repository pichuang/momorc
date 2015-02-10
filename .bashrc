#Set the following to make all x terminals have proper PS1 and PS2
# \033[0;30m - Black
# \033[0;31m - Red
# \033[0;32m - Green
# \033[0;33m - Orange
# \033[0;34m - Blue
# \033[0;35m - Cyan
# \033[0;36m - Light Blue
# \033[0;37m - Grey
# \033[0;39m - White

function get_exit_code {
    case "$?" in
        0) echo -e "\033[1;34m$?\033[0m" ;;
        *) echo -e "\033[1;31m$?\033[0m" ;;
    esac
}

function parse_git_dirty {
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}


TERM=xterm-256color
#export PS1="\n\[\033[1;37m\]\342\224\214($(if [[ ${EUID} == 0 ]]; then echo '\[\033[01;31m\]\h'; else echo '\[\033[01;34m\]\u@\h'; fi)\[\033[1;37m\])\342\224\200(\$(get_exit_code)\[\033[1;37m\])\342\224\200(\[\033[1;34m\]\@ \d\[\033[1;37m\])\[\033[1;37m\]\n\342\224\224\342\224\200(\[\033[1;32m\]\w\[\033[1;37m\])\342\224\200(\[\033[1;32m\]\$(ls -1 | wc -l | sed 's: ::g') files, \$(ls -sh | head -n1 | sed 's/total //')b\[\033[1;37m\])\342\224\200\$(parse_git_branch)> \[\033[0m\]"

#export PS1="\t \u@\h \W \$(parse_git_branch) \$(get_exit_code) \n$ "
export PS1="\[\e[1;36m\]\t \[\e[01;33m\]\u\[\e[m\]@\h \$(get_exit_code) \w \$(parse_git_branch) \n$ "


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
   alias ..='cd .. && ll'
   alias fuck='sudo $(history -p \!\!)'

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
[[ -s "$HOME/ENV/bin/activate" ]] && . "$HOME/ENV/bin/activate" # Load virtualenv
[[ -f "/usr/share/bash-completion/bash_completion" ]] && source "/usr/share/bash-completion/bash_completion" #bash-completion


