#!/usr/bin/perl

#Using object-oriented programming methods, write a Perl module that creates objects that 
#generate random protein sequences. The objects should generate either fixed length or random length sequences.

#use strict;
use warnings;
 
use final_q3_random_sequence;
my $randSeq1 = final_q3_random_sequence->new(50);
print $randSeq1->seq();
print "\n"; 
my $randSeq2 = final_q3_random_sequence->new(50, 1);
print $randSeq2->seq(); 
print "\n"; 



