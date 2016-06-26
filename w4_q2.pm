#! /usr/bin/perl
#week 1
#q2

#Place the function from last week's "two argument" random DNA 
#generation question into a module. The module should 
#export the function.




 package w4_q2;
  
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