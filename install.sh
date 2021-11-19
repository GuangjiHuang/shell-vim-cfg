#! /bin/bash

# the gobal var of the path
common_install_path=~
vim_install_path=~/.vim/

if [ -d ~/.vim ];then
    mkdir -p ~/.vim
fi

case $1 in
    "bash")
        cp -r bash/.* $common_install_path
        echo "->Successfully install the bash!"
        ;;

    "vim")
        cp vim/.vimrc $common_install_path
        cp -r vim/hgj-vim-config $vim_install_path
        echo "->Successfully install the vim!"
        ;;

    "tmux")
        cp tmux/.tmux.conf $common_install_path
        echo "->Sucessfully install the tmux!"
        ;;

    "input")
        cp input/.inputrc $common_install_path
        echo "->Sucessfully install the input!"
        ;;

    "all")
        cp -r bash/.b* input/.i* tmux/.t* vim/.vimrc $common_install_path
        cp -r vim/hgj-vim-config $vim_install_path
        echo "->Sucessfully install bash/vim/tmux/input configuration files!"
        ;;

    "help")
        ;;
    *)
        echo "Invalid input! Reference to the help option!"
        ;;
esac
