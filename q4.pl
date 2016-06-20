#! /usr/bin/perl
#q4.pl

#use strict;
use warnings;
use diagnostics;

print "started\n";





my $test1 = BuildSequence(10);
my $test2 = BuildSequence(15, "true");

print "$test1";
print $test2;

sub BuildSequence
{
my ($seqLength, $varLength) = ( @_ );

my $seqOutput = "";
if ($varLength) 
{
	$buildLength = int( rand( $seqLength) + 1);
}
else
{
	$buildLength = $seqLength;
}

for (my $i = 0; $i < $buildLength; $i++)
{
 	my $base = int( rand( 4 ));
 	if ($base == 0)
 {
 		$seqOutput = "$seqOutput" . "a";
 }
 	elsif ($base == 1)
 {
 		$seqOutput = "$seqOutput" . "c";
 }
 	elsif ($base == 2)
 {
 		$seqOutput = "$seqOutput" . "g";
 } 
 	else 
 {
 		$seqOutput = "$seqOutput" . "t";
 } 
}
	return ("$seqOutput\n");

}