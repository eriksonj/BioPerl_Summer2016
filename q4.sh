#! /bin/sh
#q4 - loop to copy html and cgi




mkdir -p ~/public_html/html ~/public_html/cgi
cd ~/my_project
if COPY_ALL=1; then
	cp -r html/* ~public_html/html
	cp -r cgi/* ~public_html/cgi
else
	test html/* -nt ~public_html/html; do
		cp -r html/* ~public_html/html
	done

	test cgi/* -nt ~public_html/cgi: do
		cp -r cgi/* ~public_html/cgi
	done
fi
