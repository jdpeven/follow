#!/bin/bash

#add to .bashrc
#shopt -s histappend
#PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

line=$(tail -1 ~/.bash_history)	#pulls the last command from 

for word in $line
do
    last=$word
done
if [ ${last:0:1} = "~" ]	#starts with ~
    then
	#echo "Need to change home"
	last=$HOME${last:1}	#attaches home to the path 
	#echo $last
fi

if [[ -d $last ]] 
    then        
	echo $last
    else
        echo "error"
fi
