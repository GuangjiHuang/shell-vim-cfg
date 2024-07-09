# Simple usage
## introduction
This reposority is for some common use tool, such as the bash, vim, git, tmux, gdb and so on, it stores the configuration files. You can manage you cfg easily. for example, copy you local cfgs, or backen you cfgs, or depoly your cfgs to the new computer.

## usage:
1) cd cfg-script

2) python cfg-script [block] [file] [operation]

more details:
	block: is the file without extension in the directory, such as the bash, vim, tmux and so on.
	file: is the block's specified file, you can get it inside the fils, such as the ".bashrc"
	operatiosn: 
		-> s2b: src to backen
		-> s2d: src to dest
		-> b2s: backen to src
		-> b2d: backen to dest
		-> d2s: dest to src
		-> d2b: dest to bd

3) you can omit the [block] and the [file], if you ommit the block, if will operate all the block,
you can ommit the [file], if you ommit the file, it will operate the block's all files.

4) You can not ommit the [opeartion];

5) if you do the s2d or b2d, it will cover the local machine files, so it will required your comfirmation. You just to type "yes", that is ok.

