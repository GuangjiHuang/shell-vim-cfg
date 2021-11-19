#! /bin/bash

# the gobal var of the path
common_install_path=~
vim_install_path=~/.vim/
backup_path=cfg-backup

if [ ! -d  $backup_path ]; then
    mkdir $backup_path
fi

# backup the files of the all dir's file
tools_cfg=("bash" "vim" "tmux" "input")
for tool_cfg in ${tools_cfg[@]}
do
    # when the $1 in the tools_cfg, then enter to execute
    if [ "$1" != "$tool_cfg" ];then
        continue
    fi
    # mkdir of the backup_path
    if [ ! -d $backup_path/$tool_cfg ];then
        mkdir -p $backup_path/$tool_cfg
    fi
    # change dir to the tool_cfg to ls -a 
    cd $tool_cfg
    for file_or_dir in $(ls -a)
    do
        # filter the .. and the .
        if [[ $file_or_dir =~ \.$ ]];then
            continue
        fi
        # check the file_or_dir is in the original file
        if [ -e $common_install_path/$file_or_dir ];then
            case $2 in
            "backup")
                cp -r $common_install_path/$file_or_dir ../$backup_path/$tool_cfg
                ;;

            "remove")
                rm -r $common_install_path/$file_or_dir
                ;;

            "install")
                cp -r $file_or_dir $common_install_path/$file_or_dir
                ;;

            "renew")
                # copy the install_path to the this 
                cp -r $common_install_path/$file_or_dir .
                ;;
            esac
        fi
        # for vim, have to check the $vim_install_path
        if [ "$tool_cfg" == "vim" ];then
            if [ -e $vim_install_path/$file_or_dir ];then
                case $2 in
                "backup")
                    cp -r $common_install_path/$file_or_dir ../$backup_path/$tool_cfg
                    ;;

                "remove")
                    rm -r $common_install_path/$file_or_dir
                    ;;

                "install")
                    cp -r $file_or_dir $common_install_path/$file_or_dir
                    ;;

                "renew")
                    # copy the install_path to the this 
                    cp -r $common_install_path/$file_or_dir .
                    ;;
                esac
            fi
        fi
    done
    cd ..
done
