#! /bin/sh
#q2 - loop to copy html and cgi

mkdir -p ~/public_html/html ~/public_html/cgi
cd ~/my_project
until cp -r html/* ~public_html/html; do
	echo "copy failed - retrying"
	sleep 5
done

until cp -r cgi/* ~public_html/cgi; do
	echo "copy failes - retrying"
	sleep 5
done

