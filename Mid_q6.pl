##!/usr/bin/perl
#Midterm Q6
#Mid_q6.pl



#Write two functions max_num() and min_num() that, when passed a list of numbers, return 
#the largest and smallest items, respectively.



use strict;
use warnings;

sub max_num
{
	my (@list) = ( @_);
	my $max = $list[0];
	foreach my $indiv(@list)
	{
		if ($indiv > $max)
		{
			$max = $indiv;
		}
	}
	return $max;
}


sub min_num
{
	my (@list) = ( @_);
	my $min = $list[0];
	foreach my $indiv(@list)
	{
		if ($indiv < $min)
		{
			$min = $indiv;
		}
	}
	return $min;
}

my @list = (-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5);

my $max = max_num(@list);
my $min = min_num(@list);

print("Max number is: " . $max . "\n");
print("Min number is: " . $min . "\n");


