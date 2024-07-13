#! /bin/bash

dst_path=~/usr/bin
src_path=./cfg-script/cfg.py

if [ ! -d $dst_path ]; then
	mkdir -p $dst_path
fi

cp $src_path $dst_path
echo "$src_path -> $dst_path"
 

