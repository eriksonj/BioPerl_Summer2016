#! /usr/bin/perl

use strict;
use warnings;

print mult_table(5);

sub mult_table {
	my( $k ) = ( @_ );
	my $totalOutput = "";
	for (my $i = 1; $i < ($k + 1); $i++){
 			my $output = "$i";
 				for (my $j = 2; $j < ($k + 1); $j++){
  					my $num = $i * $j;
  					$output = "$output $num"; 
		} 
 		$totalOutput = "$totalOutput $output\n";
}
return ($totalOutput);
}
