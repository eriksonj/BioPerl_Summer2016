#! /usr/bin/perl

use strict;
use warnings;

for (my $i = 1; $i < 13; $i++){
 my $output = "$i";
 for (my $j = 2; $j < 13; $j++){
  my $num = $i * $j;
 	# print " $num";
  $output = "$output $num"; 
  #print "output is $output\n";
} 
 print "$output\n";
}
