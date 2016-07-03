 #! /opt/perl/bin/perl
 #w5_q2_b.pl
  
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

my $seqs = retrieve( 'file' );

use Data::Dumper;
#print Dumper $seqs;

foreach my $seq(@{$seqs}) {
   BASE: foreach my $base ( qw/ A C G T / ) {
      if ( $seq =~ /$base{4}/ ) {
        print "$base run found in sequence:\n";
        print("\t" . $seq . "\n");
        last BASE;
      }
    }
  }