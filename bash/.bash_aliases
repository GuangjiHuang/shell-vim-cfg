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
alias b='. b' # backward 
alias f='. f' # forward 
alias c='. c' # change dir, command

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
    alias cygwin-install='/cygdrive/d/cygwin64/setup-x86_64.exe -q -P &'
    alias cygwin='/cygdrive/d/cygwin64/setup-x86_64.exe &'
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

#  ************************** work, type, English ****************************
English_main_dir=${HOME}/mygithub/shell-script/tmux-manager/English-code
type_main_dir=${HOME}/mygithub/shell-script/tmux-manager/type-code
source_dir=${HOME}/mygithub/shell-script/tmux-manager
work_data_dir=${HOME}/mygithub/data-shared/work_management/data
type_data_dir="${HOME}/mygithub/data-shared/type"
English_data_dir="${HOME}/mygithub/data-shared/English"
alias to-English='python ${English_main_dir}/main.py -workspace $English_data_dir'
alias to-type='python ${type_main_dir}/main.py -workspace $type_data_dir'
alias to-work='cd $source_dir/work_management; ./main.exe $work_data_dir'

#  ************************** about the prompt strintg ****************************
ps_l=$PS1
ps_m="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\W\[\033[00m\]$ "
ps_just_uh="\[\033[01;33m\]\w\[\033[00m\]$ "
ps_just_dir="\[\033[01;32m\]\u@\h\[\033[00m\]$ "
ps_custom="\[\033[01;32m\]@hgj\[\033[00m\] [\[\033[01;33m\]...\W\[\033[00m\]]${LIGHTRED}->:${NOCOLOR} "
alias pss='export PS1=$ps_custom'
alias psl='export PS1=$ps_l'
alias psm='export PS1=$ps_m'
alias psuh='export PS1=$ps_just_dir'
alias psd='export PS1=$ps_just_uh'

#  ************************** proxy ****************************
alias on_proxy='export https_proxy=127.0.0.1:7891; export http_proxy=127.0.0.1:7891'
alias off_proxy='unset https_proxy; unset http_proxy'
alias test_proxy='curl -I https://www.youtube.com >/dev/null 2>&1 && echo "Request youtube.com successfully!"'
# --
if [[ $(uname) == CYGWIN* ]]; then # this is the pattern match
    alias pip3='/cygdrive/d/Python38/Scripts/pip3.exe'
fi

#  ************************** about the git command ****************************
alias git_push='git add . && git commit -m "update->$(datef)" && git push'
alias git_pull='git pull || git fetch --all && git reset --hard origin/master && git pull'

#  ************************** about the inputrc ****************************
alias readline='bind -f ~/.inputrc'

# ******************** show the gpu usage ********************
alias show='nvidia-smi -l'
alias pose='conda activate alphapose'
alias base='conda activate base'
alias hgj='ps -ef | grep hgj'
alias stop='pgrep -f "sys-detect" | xargs sudo kill -9; pgrep -f "hgj" | xargs sudo kill -9'
alias start='. /opt/startup/hgj_startup.sh'
