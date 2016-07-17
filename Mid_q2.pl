##!/usr/bin/perl
#Midterm Q2
#Mid_q2.pl

#Write a subroutine that returns a reference to a hash. Write a script that (a) declares a 
#reference to this function, (b) calls the function via the reference, and (c) prints out the 
#hash whose reference is returned from the subroutine.

use strict;
use warnings;

sub returnHashRef
{
	my %ntTypes = ("adenine" => "purine", "guanine" => "purine", "cytosine" => "pyrimidine", "thymine" => "pyrimidine");
	return \%ntTypes;
}

my $subRef = \&returnHashRef;

my $stuff = &$subRef;

foreach (keys %$stuff)
{
	print "$_ --> ${$stuff}{$_}\n";
}