#!/usr/bin/perl
#w9_q1.pl

#Write a program that takes the name of a FASTA file as its argument. 
#The program should parse the FASTA file and present a list of the 
#sequences the file contains, then allow the user of the program to 
#select one or more sequences to BLAST against the appropriate database.

#NOTE The blast_sequence() method in Bio::Perl, contrary to what the 
#documentation says, always runs BLASTP. Consequently, you will need 
#to translate the nucleotide sequences before BLASTing them.


#use strict; 
use warnings;

use Bio::Perl;


print "Please enter in a fasta file parse \n";
my $inputFile = <STDIN>;

#my $inputFile = "UnAligSeq24606.txt";


my @bio_seq_objects = read_all_sequences( $inputFile , "fasta");


foreach my $seq ( @bio_seq_objects ) {
    my $name      = $seq->display_id;
    my $sequence  = $seq->seq;

    print "
NAME: $name
 SEQ: $sequence
";
}



while(defined(my $answer = prompt("Enter in the name of a sequence to BLAST.  Type q or quit to exit. "))) {
  last if $answer eq "q"
       or $answer eq "quit"
}

sub prompt {
  	my ($input) = @_;
  	print($input);
  	local $| = 1;  # set autoflush;
  	chomp( my $userInput = <STDIN> // return undef);
	foreach my $seq ( @bio_seq_objects ) {
	    if ($userInput eq $seq->display_id)
	    {
	    	my $prot = "";
	    	if($seq->seq =~ /\A[acgt]+\z/i)
			{
			    $prot = translate( $seq->seq );
			    print "Translating $userInput \n";
			}
			else
			{
				$prot = $seq->seq;
			}
		  	my $blast = blast_sequence( $prot );
			my $file  = './' . $userInput . '_blast_output';
			write_blast( ">$file" , $blast );
	    	print "The return was output to $file \n";
	    	last;
	    }
	}
	return $userInput;
  
}

