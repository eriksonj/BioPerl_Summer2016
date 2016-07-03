 #! /opt/perl/bin/perl
 #w5_q1.pl


#Write a function which takes two arrays as arguments 
#(passed by reference) and returns a reference to an array of arrays, 
#consisting of the products of the elements of the two arrays. 
#Write a script that uses the function and then prints out the resulting matrix.
         # Example:
          # input == ( 1 , 2 , 3 ) and ( 2 , 4 , 6 )
          # output ==
          #          2  4  6
          #          4  8 12
          #          6 12 18
          
          
#use strict;
use warnings;
use Data::Dump qw(dump);

my @arr1 = (1, 2, 3);
my @arr2 = (2, 4, 6);

print( "input == (" .  join(", ", @arr1) . ") and (" . join(", ", @arr2) . ")\n");
print("output == \n");

my $arr3 = getAOA(\@arr1, \@arr2);




foreach my $row(@{ $arr3 })
{
	my $output = "\t";
	foreach my $element(@$row)
	{
		$output .= $element . " ";
	}
	$output .= "\n";
	print($output);
}


sub getAOA{
	my ( $array1, $array2 ) = @_;
	my @output = ();
	my $arr1Size = @$array1;
	my $arr2Size = @$array2;
	foreach my $index2 (0 .. ($arr2Size - 1))
	{
		my @tempArr = ();
		foreach my $index1 (0 .. ($arr1Size - 1))
		{
			my $x = @$array1[$index1] * @$array2[$index2];
			$tempArr[$index1] = $x;
		}
		$output[$index2] = \@tempArr;
	}
	return \@output;
}


