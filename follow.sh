#!/bin/bash

#add to .bashrc
#shopt -s histappend
#PROMPT_COMMAND="history -a;$PROMPT_COMMAND"


line=$(tail -1 ~/.bash_history)

for word in $line
do
    last=$word
done
#echo "Trying to view" $last
#echo ${last:0:1}
if [ ${last:0:1} = "~" ]		#starts with ~
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
