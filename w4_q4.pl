#! /usr/bin/perl
#week 1
#q4

#Use Test::Simple to produce a simple test framework that exercises 
#the module from the previous questions.

  use strict;
  use warnings;
  

use Test::Simple tests => 2;



use w4_q3 'random_sequence';



my $dna = random_sequence();

my $length = 50;



ok( length( $dna ) == $length   , "string length checks" );

ok( $dna =~ /^[ACGT]{$length}$/i , "string composition checks" );