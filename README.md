# follow
A shell script that will let you "follow" the last path entered.
Read the last entry from ~/.bash_history, checks to see if the last element is a directory, and if it is it will move to that directory.

Example:
-> ~$ cp myFile ~Desktop/Homework/Assignment1
-> ~$ follow
-> ~/Desktop/Homework/Assignment1$ ls
myFile
