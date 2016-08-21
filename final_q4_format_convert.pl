#!/usr/bin/perl

#Use the BioPerl modules to write a script that converts a sequence file (in any format) 
#to any other format that BioPerl supports. Running the script should look like this:

#  $ ./format_convert ./genbank-data.gb fasta Wrote ./genbank-data.fasta  



use warnings;
#use strict;

use Bio::Perl;

my $file=$ARGV[0];
my $format=$ARGV[1];

my @words = split /\./, $file;

my $file_name = $words[1] . $format;

my @bio_seq_objects = read_all_sequences( $file , $words[2] );



write_sequence( ">$file_name" , $format , @bio_seq_objects );