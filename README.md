# follow
A shell script that will let you "follow" the last path entered.
To accomplish this, the script reads the last entry from ~/.bash_history, checks to see if the last element is a directory, and if it is it will move to that directory.

Example:
```
-> ~$ cp myFile ~Desktop/Homework/Assignment1

-> ~$ follow

-> ~/Desktop/Homework/Assignment1$ ls
myFile
```
## How to run
1. Add the following lines to ~/.bashrc to write to ~/.bashhistory automatically
      ```
      shopt -s histappend
      PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
      ```
2. Save "follow.sh" on your computer
      1. Make it executable
      ```
      chmod +x follow.sh
      ```
3. Add the alias to your ~/.bashrc
  ```
  alias follow='cd $(PATH/TO/FOLLOW.SH)'
  ```
### How it works
1. After updating when you write to ~/.bashhistory, 
  ```
  line=$(tail -1 ~/.bash_history)
  ```
  will pull the last entry from the bashhistory
  
2. Then we will check to see if the last element in the command is '~', and replace it with $HOME
  ```
  if [ ${last:0:1} = "~" ]
    then
	last=$HOME${last:1}
  fi
  ```
3. We then check if the element is a directory or not (wouldn't work with '~')
  ```
  if [[ -d $last ]]
  ```
4. If it is, we echo the path, otherwise we echo '.'
5. The reason we echo the path is that if we run 'cd path' in the shell script, it will only cd in the running process which was forked by bash, and when the shell script completes running, the execution image will return to the original process/pwd. Thus, the alias in ~/.bashrc is 
  ```alias follow='cd $(PATH/TO/FOLLOW.SH)'```
If there is an error and the path is not found, it echos '.' which will just cd to the current directory, effectively doing nothing.
