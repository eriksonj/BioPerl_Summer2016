package final_q1_mod;

#use strict;
use warnings;

  use Exporter 'import';
  our @EXPORT_OK = ( "random_sequence" );
  
  sub random_sequence {
    my( $length , $random_length ) = @_;
    my @aa = qw/ A R N D C E Q G H I L K M F P S T W Y Z /;
    if ( $random_length ) {
      $length = int( rand( $length ));
    }
  	my $seq = "";
    foreach ( 1 .. $length ) {
      $seq = $seq . $aa[int(rand(20))];
    }
    return $seq;
  }
  
  # use it
  1;