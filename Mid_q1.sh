#! /bin/sh
#Mid_q1.sh
#Write a shell script that uses a for loop to move a set of files from one directory to another.

cd /Users/Jonathan_Erikson/Desktop/testFiles
for file in *; do 
     mv /Users/Jonathan_Erikson/Desktop/testFiles/$file /Users/Jonathan_Erikson/Desktop/temp/$file
done