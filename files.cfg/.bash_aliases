#  ****************************inline command extension****************************
alias cl='clear'
alias lh='ls -lh'
# use the sub as the alias to renew the ~/.bash
alias sub='source ~/.bashrc'
alias datef='date "+%Y-%m-%d %a %X"'

#  **************************** my script's aliases ****************************
alias p='. p'
alias wr='. wr'


#  **************************** the other app ****************************
# the ygwin, to install the new( just in the cygwin)
if [ ${uname -o} == "Cygwin" ]; then
    alias cygwin='/cygdrive/d/cygwin64/setup-x86_64.exe -q -P'
fi
#  **************************** the timer (timer.py)****************************
alias timer='python d:/cygwin64/opt/timer/timer.py'

#  **************************** the git and the github****************************
export github_prefix="git@github.com:GuangjiHuang"

