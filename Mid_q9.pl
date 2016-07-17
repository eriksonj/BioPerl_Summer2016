#!/opt/perl/bin/perl
use warnings;
use Test::Simple tests => 5;




#Write a test script using Test::Simple that exercises the module from the previous question. 
#(Hint: think of things that could go wrong. What assumptions are you making about the input?
#What if they're wrong?) Your module should contain at least five tests.


use Mid_Q8 'translate_dna';

#normal string
my @prots = translate_dna("ATGACGTACGTAAATTTATGTAAATGAAATAATGA");
ok((scalar @prots > 0), "Normal sequence outputs a sequence");

#numbers
 @prots = translate_dna("ATGAC45343TTTATGTAAATGAAATAATGA");
ok((scalar @prots == 0), "Numbers in sequence dont output a sequence");

#spaces
 @prots = translate_dna("ATGAC453   GTAAATGAAATAATGA");
ok((scalar @prots == 0), "Spaces in sequence dont output a sequence");

#non-nt letters
 @prots = translate_dna("ATGACFOOBARTATGTAAATGAAATAATGA");
ok((scalar @prots == 0), "Non-nt letters in sequence dont output a sequence");

#no start
 @prots = translate_dna("TAGTAAAGAAATAAGA");
ok((scalar @prots == 0), "No start in sequence dont output a sequence");

