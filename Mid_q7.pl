##!/usr/bin/perl
#Midterm Q7
#Mid_q7.pl


#Write a function than reads the following table into a two dimensional array, transposes 
#the array, and outputs the result.
#
#    input:   one    two    three           
#             four   five   six           
#             seven  eight  nine   
#  output:  one    four   seven           
#           two    five   eight 
#           three  six    nine  

use warnings;


sub transverseThings
{
	my (@input) = (@_);
	my @transversed = ();
	my @output = ();
	my $count = 0;
	my $width;
	foreach my $x(@input)
	{
		my @temp = ();
		foreach my $y(@$x)
		{
			push(@temp, $y);
		}
		$output[$count] = \@temp;
		$width = scalar(@temp);
		$count += 1;
	}
	my $height = scalar(@output);
		
	$count = 0;
	for my $x (0 .. $height)
	{
		my @temp = ();
		for my $y (0 .. $width)
		{
			push(@temp, $output[$y][$x]);
		}
		$transversed[$count] = \@temp;
		my $width = scalar(@temp);
		$count += 1;
	}
	return @transversed;
}

my @input = (["one", "two", "three"] , ["four", "five", "six"] , ["seven", "eight", "nine"]);
my @transversed = transverseThings(@input);
foreach my $row (@transversed) 
{
    foreach my $element (@$row) 
    {
        print( $element . " ");
    }
    print("\n");
}
