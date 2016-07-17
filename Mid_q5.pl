##!/usr/bin/perl
#Midterm Q5
#Mid_q5.pl

#Write a program to compute the annealing temperature of an oligomer (2 degrees C per A or T; 
#4 degrees C per C or G). In addition to the annealing temp, the program should also output 
#the GC content of the oligo -- i.e., what percent of bases in the oligo are G or C.

use strict;
use warnings;
use Math::Round;

my $gc = 0;
my $annealTemp = 0;
my $seq = "AGCTGGTGTCATT";

my @chars = split("", $seq);
for my $char(@chars)
{
	if (($char eq "A") or ($char eq "T"))
	{
		$annealTemp += 2;
	}
	else
	{
		$annealTemp += 4;
		$gc += 1;
	}
}
print("Annealing Temp is: " . $annealTemp . "\n");
print("GC is: " . nearest(0.01, ($gc / length($seq))) . "%\n");


