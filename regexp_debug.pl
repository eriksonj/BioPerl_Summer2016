#! /usr/bin/perl
#q6.pl

#use strict;
use warnings;


  
  print "Enter regexp: ";
  my $regEx = <STDIN>;
  print "Enter string or 'exit' to exit; ";
  my $input = <STDIN>;
	my $continue = 1;
	      

while ($continue > 0)
{
  if ( $input =~ m/$regEx/ )
	{ 
	print "Match!\n";
	}
	else
	{
	print "No match!\n";
	}
	print "Enter string or 'exit' to exit; ";
  	$input = <STDIN>;
  	#chomp ( $input );
  	if ($input =~ m/exit/)
  	{
  	$continue = 0;
  	}
}
