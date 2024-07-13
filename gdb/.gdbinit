set print pretty on
#source ~/gdbinit/mystruct.py

define finishn
set $count = $arg0
while $count > 0
	finish
	set $count = $count - 1
end
end
