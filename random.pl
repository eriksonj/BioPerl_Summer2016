#! /usr/bin/perl
#q3.pl
#write a script to generate random DNA sequences of a given length

#use strict;
use warnings;

$seqLength = 25;
$seqOutput = "";

for (my $i = 0; $i < $seqLength; $i++)
{
 my $base = int( rand( 4));
 if ($base == 0)
 {
 	$seqOutput = $seqOutput . "a";
 }
 elsif ($base == 1)
 {
 	$seqOutput = $seqOutput . "c";
 }
 elsif ($base == 2)
 {
 	$seqOutput = $seqOutput . "g";
 }
 else 
 {
 	$seqOutput = $seqOutput . "t";
 } 
}
print "$seqOutput\n";

