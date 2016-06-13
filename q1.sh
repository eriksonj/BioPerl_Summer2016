#! /bin/sh
# q1.sh
#this script uses a loop to generate a basic project directory tree

#this loop creates multiple directory trees
#dependent on the values set

$ numDirectories=3

for i in $(seq 1 numDirectories); do
	mkdir /home/jerikso1/proj/w2q1_test_dir${i}
	cd /home/jerikso1/proj/w2q1_test_dir${i}
	mkdir bin etc doc cgi html lin sbin src
	touch Changes.txt Makefile.txt
	


