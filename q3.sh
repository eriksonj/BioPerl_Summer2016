#! /bin/sh
#q2 - loop to copy html and cgi

mkdir -p ~/public_html/html ~/public_html/cgi
cd ~/my_project
test html/* -nt ~public_html/html; do
	cp -r html/* ~public_html/html
done

test cgi/* -nt ~public_html/cgi: do
	cp -r cgi/* ~public_html/cgi
done

