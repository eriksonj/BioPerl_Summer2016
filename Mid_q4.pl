##!/usr/bin/perl
#Midterm Q4
#Mid_q4.pl




#Write a regular expression that will match a target string consisting only of an integer 
#number. Write one that will match a string containing only an integer or a decimal number. 
#Write one that will match a string containing a positive or negative integer or decimal 
#number. Write one that will match a string containing only a positive or negative number 
#in scientific notation (e.g., -3.5e6).


my $num = 1000;

if ($num =~ /^\d+$/)
{
	print("1 - This is an integer\n");
}

$num = 0.5;
if ($num =~ /^\d*\.?\d*$/)
{
	print("2 - This is an integer or a decimal\n");
}

$num = -0.4;
if ($num =~ /\-*\d*\.?\d*$/)
{
	print("3 - This is a positive or negative integer or a decimal\n");
}

$num = -3.5e6;
if ($num =~ /[+\-]?(?:0|[1-9]\d*)(?:\.\d*)?(?:[eE][+\-]?\d+)?/)
{
	print("4 - This is scientific notation\n");
}




