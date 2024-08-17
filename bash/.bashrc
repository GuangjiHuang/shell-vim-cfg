# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
# change this -by hgj
color_prompt=yes
if [ "$color_prompt" = yes ]; then
	user_name=$(whoami)
	host_name=$(uname -n)
	if [[ "$user_name" =~ guangji && "$host_name" =~ .*workstation.* ]]; then
		hgj_custom_string="[HGJ-0${host_name: -1}]"
		PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]${hgj_custom_string}\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
	else
		PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$ '
	fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alFh'
alias la='ls -Ah'
alias l='ls -CFh'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
#    . /etc/bash_completion
#fi
############################## add your own ####################
############### loop to execute the file in the .bash-config-add ##########
bash_config_add_path=~/.bash-config-add
if [ -e $bash_config_add_path ]; then
    for file in $bash_config_add_path/.bash* 
    do 
        # skip of the swap file
        if ! [[ $file =~ .*\.swp ]] && [ -f $file ]; then 
            . ${file}
        fi
    done
fi
############################## echo the promote(that has the color) ####################
#export PS1="\e[0;31m[\u@\h \w]\\$ \e[m"
#clear
echo -e "${BLUE}==========${NOCOLOR} ${RED}Welcome root${NOCOLOR} ${BLUE}==============${NOCOLOR}"
set -o vi
############## change the inline shell(the option in the set and the shopt)####################
# turn on this option let you can use the ** to match any directories or the subdirectoies or the files, and the **/ (adding the backslash, that matching any directories or the subdirectories)
shopt -s globstar 
shopt -s extglob
shopt -s dotglob


############### for the tmux bash ##########
#export LANG=$(locale -uU) # solve the problem that inside the tmux that can not show the Chinese
if [ -n "$TMUX" ]; then
    # set the PS1 to the newline
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$\n '
    # execute the file of the mode control
    mode_control_file_path=/opt/myscript/tmux-manager/mode-control.sh
    if [ -f $mode_control_file_path ];then
        source $mode_control_file_path
    fi
fi
# switch to the another session by the name
to()
{
    if [ -n "$1" ];then
        tmux switch -t $1
    else
        echo "No session name!"
    fi
}

#-------------- add the newline if the PS1 is too long ----------
#cout_path=$(pwd | wc -m)
#cout_threshold=50
#if [ $cout_path -gt $cout_threshold ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[00m\]\$\n '
#fi

#export LANG='en_US'
#export LANG='UTF-8'

export EDITOR="vim"

#------ vscode, clion and pycharm use the cygwin as the terminal -------
# win and env meet the need
if [[ $(uname) =~ CYGWIN.* ]] && [ $OLDPWD ] && [ $TERMINAL_EMULATOR -o $TERM_PROGRAM ];then
    echo "cd $OLDPWD"
    cd $OLDPWD
fi

# set the DISPLAY to show remote x11
if [[ ! $(uname) == "Linux" ]];then
    export DISPLAY=:0.0
fi

# use the wls as 
if [[ $(uname) =~ CYGWIN.* ]] && command -v wsl > /dev/null 2>&1;then
	exec wsl
	#exec wsl /usr/bin/bash -l -c "wsl"
fi


# add the ~/usr/bin to the PATH
export PATH=~/bin:${PATH}
export PATH=~/usr/bin:${PATH}
export PATH=~/usr/local/bin:${PATH}
export PATH=${PATH}:~/opt/c-linter/cquery/build/release/bin:~/opt/c-linter/clang-llvm-13.0.1/bin:~/opt/c-linter/ccls/Release


# source the .bashrc_func
if [ -f ~/.bashrc_func ]; then
	source ~/.bashrc_func
fi

# config the autojump
auto_jump_run_path=/usr/share/autojump/autojump.sh
z_sh_path=/usr/local/bin/z.sh
if [ -f $auto_jump_run_path ]; then
	. $auto_jump_run_path
fi
if [ -f $z_sh_path ]; then
	. $z_sh_path
fi
