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
alias mygit='. mygit'
alias love='. love'
alias c-='wr -c' #copy the current path to the /dev/clipboard
alias v-='wr -v' #show the /dev/clipboard to the terminal
alias cfg='. cfg' #cfg-manager

# >> This may be somebit verbose for the wr
alias go-b='wr -v b go' # go to the bash_test
alias go-c='wr -v c go' # go to the c++_test
alias go-j='wr -v j go' # go to the java_test
alias go-p='wr -v p go' # go to the python_test
alias go-m='wr -v m go' # go the the markdown_test
alias go-v='wr -v v go' # go to the vim_test
# << verbose ...

# >> This may be somebit verbose for the love
alias *='love action'
alias @='love you'
# << verbose ...

#  **************************** the other app ****************************
# the ygwin, to install the new( just in the cygwin)
if [ $(uname -o) == "Cygwin" ]; then
    alias cygwin-install='/cygdrive/d/cygwin_again/setup-x86_64.exe -q -P &'
    alias cygwin='/cygdrive/d/cygwin_again/setup-x86_64.exe &'
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

#  ************************** typora and the when-changed ****************************
#alias preview_md='when-changed /cygwin/d/Typora/Typora.exe 

#  ************************** the vifm.exe ****************************
alias vifm='c:/Users/97682/Downloads/vifm-w32-se-0.12-binary/vifm.exe $(cygpath -w $(pwd))'

