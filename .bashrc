#
# Phil Huang <pichuang@cs.nctu.edu.tw>
#
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

export TERM=screen-256color
PATH=${PATH}:${HOME}/.composer/vendor/bin
export EDITOR=/usr/bin/vim
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [[ $EUID -eq 0 ]];then
    export PS1="\[\e[1;36m\]\t \[\e[01;31m\]\u\[\e[m\]@\h \$(get_exit_code) \w \$(parse_git_branch) \n$ "
else
    export PS1="\[\e[1;36m\]\t \[\e[01;33m\]\u\[\e[m\]@\h \$(get_exit_code) \w \$(parse_git_branch) \n$ "
fi

export PS4='Line ${LINENO}: '
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

test -d ~/.histfile/ || mkdir ~/.histfile/
if [ "$?WINDOW" ] ; then
   export HISTFILE=~/.histfile/hist$WINDOW
else
   export HISTFILE=~/.histfile/hist
fi

alias hw="history -w ~/.histfile/last"
alias hr="history -r ~/.histfile/last"
alias ha="history -a ~/.histfile/last"
alias hn="history -n ~/.histfile/last"
alias hc="history -c"

if [[  `uname` =~ "Linux" ]] ; then

   alias ls='ls --color=auto'
   alias ll='ls -alF'
   alias la='ls -A'

   alias grep='grep --color=auto'
   alias fgrep='fgrep --color=auto'
   alias egrep='egrep --color=auto'
   alias fuck='sudo $(history -p \!\!)'
   alias ..='cd .. && ll'
fi

set meta-flag on
set input-meta on
set convert-meta off
set output-meta on
set bell-stype none
set filec
set autolist
set autologout=0

[[ -s "$HOME/.bash_aliases" ]] && . "$HOME/.bash_aliases" # Load bash_profile
[[ -f "/usr/share/bash-completion/bash_completion" ]] && source "/usr/share/bash-completion/bash_completion" #bash-completion
