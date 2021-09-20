#  ****************************inline command extension****************************
alias cl='clear'
alias cll='clear && ll'
alias clh='clear && lh'
alias lh='ls -lh'
# use the sub as the alias to renew the ~/.bash
alias sub='source ~/.bashrc'
alias datef='date "+%Y-%m-%d %a %X"'
# use the linux's find command instead of the window's find
if [ $(uname -o) == "Cygwin" ]; then
    alias find='/usr/bin/find'
fi

#  **************************** my script's aliases ****************************
alias p='. p'
alias wr='. wr'


#  **************************** the other app ****************************
# the ygwin, to install the new( just in the cygwin)
if [ $(uname -o) == "Cygwin" ]; then
    alias cygwin='/cygdrive/d/cygwin_again/setup-x86_64.exe -q -P'
fi
# the asciiquarium
alias asq='asciiquarium'
#  **************************** the timer (timer.py)****************************
alias timer='python d:/cygwin64/opt/timer/timer.py'

#  **************************** the git and the github****************************
export github_prefix="git@github.com:GuangjiHuang"

#  ************************** the tmux ****************************
alias in='tmux attach'
alias into='tmux attach -t $1'
