#!/usr/bin/perl

#Using non-object oriented programming methods, write a Perl module that provides a 
#function called random_protein. This function should generate a random protein sequence,
# and it should support generating sequences of a fixed or a random length.




  #use strict;
  use warnings;
  
use final_q1_mod ('random_sequence');
my $length = 50;
  

  
my $rand1 =  random_sequence( 50 );
print($rand1 . "\n");
my $rand2 =  random_sequence( 50 , 1 );
print($rand2 . "\n");