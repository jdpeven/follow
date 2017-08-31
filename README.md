# follow
A shell script that will let you "follow" the last path entered.
To accomplish this, the script reads the last entry from ~/.bash_history, checks to see if the last element is a directory, and if it is it will move to that directory.

Example:

-> ~$ cp myFile ~Desktop/Homework/Assignment1

-> ~$ follow

-> ~/Desktop/Homework/Assignment1$ ls
myFile

## How to run
1. Add the following lines to ~/.bashrc to write to ~/.bashhistory automatically
      ```
      shopt -s histappend
      PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
      ```
2. Save "follow.sh" on your computer
3. Add the alias to your ~/.bashrc
  ```
  alias follow='cd $(PATH_TO_FOLLOW.SH)'
  ```
