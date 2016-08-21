#!/usr/bin/perl

package final_q3_random_sequence;
use Moose;

has 'seq' => (
    is        => 'ro',
    isa       => 'Str',
);
 

 
around BUILDARGS => sub {
    my $orig = shift;
    my $class = shift;
	if ( @_ == 2 && ! ref $_[0] )
	{
		my @args = @_;
		my $length = $args[0];
	    my $random_length = $args[1];
	    my @aa = qw/ A R N D C E Q G H I L K M F P S T W Y Z /;
	    if ( $random_length ) {
	      $length = int( rand( $length ));
	    }
	  	my $seq = "";
	    foreach ( 1 .. $length ) {
	      $seq = $seq . $aa[int(rand(20))];
	    }
	    return $class->$orig(
	    seq  => $seq,);
	}
    if ( @_ == 1 && ! ref $_[0] ) {
    	my @args = @_;
    	print @args . "\n";
	    if ( @args == 1 and ! ref $args[0] ) {
	     	my $length = $args[0];
	    	my @aa = qw/ A R N D C E Q G H I L K M F P S T W Y Z /;
		  	my $seq = "";
		    foreach ( 1 .. $length ) {
		      $seq = $seq .  $aa[int(rand(20))];
		    }
		    return $class->$orig(
		    seq  => $seq,);
	    }
    }
    else {
        return $class->$orig(@_);
    }
};
 
sub BUILD {
    my $self = shift;
}
 
1;