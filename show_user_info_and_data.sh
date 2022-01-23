#!/bin/bash
if [ $# -ne 2 ]; 
	then >&2 echo "Illegal number of parameters"
	echo "usage: ./show_user_info_and_data.sh <username> <path>"
	exit 40
else	
	if [ $1 == "root" ];
		then echo "Finding \"root\" user data is not allowed!"
		exit 42
	fi

	line="===================="
	#Show files and directories owned by a user in a directory
	list=$( find $2 -type f,d -user $1 2> /dev/null )
	echo "$line Printing files and directories owned by $1 in $2 $line"

	for item in $list
	do
		echo "$item is found!"
	done

	#Show all processes running by a user
	echo "$line Printing all processes running by $1 $line"
        ps -u $1 -o pid,user,command
fi
