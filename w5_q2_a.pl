 #! /opt/perl/bin/perl
 #w5_q2_a.pl
  
#use strict;
use warnings;
use Storable;

#Write a script that generates an array of 10 random DNA 
#50mers and uses Storable to write them out to disk. Write a 
#second script that uses Storable to read the stored sequences 
#back into memory and then loops over them printing out details 
#about which sequences contain 4mer runs of identical bases 
#(i.e., 4 As, 4 Cs, etc.) (Yes, this is the same as the problem 
#from week 3, only using Storable instead of files.)


my @bases = qw/ A C G T /;
my $length = 50;
my @seqs = ();

for $x (0 ... 10)
{
	$seqs[$x] = random_sequence($length);
}

store\@seqs , 'file';

 sub random_sequence {
    my( $length , $random_length ) = @_;
  
    my $return;
  
    if ( $random_length ) {
      $length = int( rand( $length ));
    }
  
    foreach ( 1 .. $length ) {
      $return .= $bases[int(rand(4))];
    }
  
    return $return;
  }