#! /usr/bin/perl
#week 1
#q1

#Write a simple program with a hard-coded hash of arrays. 
#The program should print out the hash of arrays when run.

use strict;
use warnings;


my @charged = ('Arg', 'Lys', 'Asp', 'Glu');

my @polar = ('Gln', 'Asn', 'His', 'Ser', 'Thr', 'Tyr', 'Cys', 'Met', 'Trp');

my @hydrophobic = ('Ala', 'Ile', 'Leu', 'Phe', 'Val', 'Pro', 'Gly');

my %hoa = ( charged  => \@charged ,

            polar => \@polar ,
            
            hydrophobic => \@hydrophobic 

          );

my $hoa_ref = \%hoa;

print "yes\n";

for my $aaType ( keys %hoa ) {
    print "AA Family: $aaType \n\t Amino Acids: @{ $hoa{$aaType} }\n";
}
