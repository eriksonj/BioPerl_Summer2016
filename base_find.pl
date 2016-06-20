#! /usr/bin/perl
#q5.pl

#use strict;
use warnings;





  
  foreach my $i ( 1..10 ) {
  	my $file = $i . ".txt";
  
  	open( my $OUT , '>' , $file ) or die( "Can't open $file ($!)" );
  	
  	my $output = BuildSequence(50);
  	
    print $OUT "$output\n";
    close $OUT;
  }
  
  
  
  foreach my $i (1..10){
    my $file = $i . ".txt";
  open( my $IN , '<' , $file ) or die ( "Can't open $file ($!)" );
  while ( my $line = <$IN> ) {
    chomp $line;
    $string = $line;
    if( $string =~ m/TTT/ ) {
  		print "T run found in $file\n";
	}
        if( $string =~ m/AAA/ ) {
  		print "T run found in $file\n";
	}
	    if( $string =~ m/GGG/ ) {
  		print "T run found in $file\n";
	}
	    if( $string =~ m/CCC/ ) {
  		print "T run found in $file\n";
	}
    
    
  }
  close $IN;
  }
  

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