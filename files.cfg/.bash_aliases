#  ****************************inline command extension****************************
alias cl='clear'
alias lh='ls -lh'
# use the sub as the alias to renew the ~/.bash
alias sub='source ~/.bashrc'

#  **************************** the other app ****************************
# the ygwin, to install the new( just in the cygwin)
if [ ${uname -o} == "Cygwin" ]; then
    alias cygwin='/cygdrive/d/cygwin64/setup-x86_64.exe -q -P'
fi
#  **************************** the timer (timer.py)****************************
alias timer='python d:/cygwin64/opt/timer/timer.py'
