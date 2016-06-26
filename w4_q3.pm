#! /usr/bin/perl
#week 4
#q3


#Modify the module from the previous question by adding 
#documentation (in POD format) to explain the two ways the 
#function can be called and the different results of each.

=pod

The random_sequence accepts 2 parameter sets:

(A)
$length - the length of the random sequence

// or //

(B)
$length - the max length of the random sequence
$random_length - a scalar, where if it exists, instructs the 
	subroutine to create the random sequence of any length in between 1
	and the $length

=cut


 package w4_q3;
  
  use strict;
  use warnings;
  
  use Exporter 'import';
  our @EXPORT_OK = ( "random_sequence" );
  

  
  sub random_sequence {
    my( $length , $random_length ) = @_;
  	my @bases = qw/ A C G T /;
    if ( $random_length ) {
      $length = int( rand( $length ));
    }
  
    foreach ( 1 .. $length ) {
      print $bases[int(rand(4))];
    }
    print "\n";
  }
  
  #random_sequence( 50 );
  #random_sequence( 50 , 1 );
  
  # use it
  1;