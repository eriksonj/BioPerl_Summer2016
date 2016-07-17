##!/usr/bin/perl
#Midterm Q8
#Mid_q8.pl




#Write a module that contains a function, translate_dna(), that translates an open reading 
#frame into a predicted protein sequence when given a DNA input. That is, given a chunk of 
#DNA which contains a start codon (ATG) followed some distance later by an in-frame stop 
#codon, this function should return the predicted protein encoded by that ORF. (Don't worry 
#about introns.) Your code should handle anomalous situations such as the input not having 
#a start codon, the input having a start codon but no stop codon, non-nucleotide characters 
#in the input, etc. In each case, return the appropriate amount of information. (E.g., 
#non-nucleotide character might result in a die(); lack of a stop codon just means you 
#translate up to the end of the DNA and return what you can; etc.)

package Mid_q8;

use warnings;
use List::Util qw(min max);

sub getIndices
{
	my ($string, $char, $offset) = (@_);
	my $result = index($string, $char, $offset);
	my @list;
	while ($result != -1) {
			push (@list, $result);
	        $offset = $result + 1;
	        $result = index($string, $char, $offset);
	}
	return \@list;
}


sub getStopIndices
{
	my ($string) = (@_);
	my @stops = ("TAG", "TAA", "TGA");
	my @list;
	for my $stop(@stops)
	{
		my $offset = 0;
		my $result = index($string, $stop, $offset);
		while ($result != -1) {
				push (@list, $result);
		        $offset = $result + 1;
		        $result = index($string, $stop, $offset);
		}		
	}
	return \@list;
}

sub translate
{
	my ($dna) = (@_);
	my $protein;
	my(%aa)=('TCA'=>'S','TCC'=>'S','TCG'=>'S','TCT'=>'S','TTC'=>'F','TTT'=>
	'F','TTA'=>'L','TTG'=>'L','TAC'=>'Y','TAT'=>'Y','TAA'=>'','TAG'=>''
	,'TGC'=>'C','TGT'=>'C','TGA'=>'_','TGG'=>'W','CTA'=>'L','CTC'=>'L','CTG'=>'L',
	'CTT'=>'L','CCA'=>'P','CCC'=>'P','CCG'=>'P','CCT'=>'P','CAC'
	=>'H','CAT'=>'H','CAA'=>'Q','CAG'=>'Q','CGA'=>'R','CGC'=>'R','CGG'=>'
	R','CGT'=>'R','ATA'=>'I','ATC'=>'I','ATT'=>'I','ATG'=>'M','ACA'=>'T',
	'ACC'=>'T','ACG'=>'T','ACT'=>'T','AAC'=>'N','AAT'=>'N','AAA'=>'K','AA
	G'=>'K','AGC'=>'S','AGT'=>'S','AGA'=>'R','AGG'=>'R','GTA'=>'V','GTC'=>'V',
	'GTG'=>'V','GTT'=>'V','GCA'=>'A','GCC'=>'A','GCG'=>'A','GCT'=>'A','GAC'=>'D',
	'GAT'=>'D','GAA'=>'E','GAG'=>'E','GGA'=>'G','GGC'=>'G','
	GGG'=>'G','GGT'=>'G');
	for (my $i = 0; $i < length($dna); $i += 3)
	{
		$protein .= $aa{substr($dna, $i, 3) };
	}
	return $protein;
}



sub translate_dna
{
	my ($str) = (@_);
	my @prots;
	if ($str =~ /^[ACGT]+$/)
	{
		print("Legitimate Sequence Found\n");
		print("Sequence:\t" . $str . "\n\n");
	}
	else
	{
		print("Non-nucleotide charecters contained in string - can not translate.\n");
		return @prots;
	}
	my $start = "ATG";
	my $startRef = getIndices($str, $start, 0);
	my @starts = sort @$startRef;
	my $stopRef = getStopIndices($str);
	my @stops = sort {$a <=> $b} @$stopRef;
	foreach my $indivStart(@starts)
	{
		my $seqStop = -1;
		foreach my $indivStop(@stops)
		{
			if (($indivStop - $indivStart) % 3 == 0 && ($indivStop > $indivStart)) 
			{
				$seqStop = $indivStop;
				my $seq = substr($str, $indivStart,($indivStop - $indivStart));
				print("ORF: \t\t" . $seq . "\n");
				$protSeq = translate($seq);
				print("Protein: \t" . $protSeq . "\n\n");
				push(@prots, $protSeq);
				last;
			}
		}	
		if ($seqStop == -1)
		{
			print("No stop codon found: \n");
			my $seq = substr($str, $indivStart, length($str));
			my $offset = ((length($str) - $indivStart) % 3 );
			my $len = (length($str) - $indivStart) - $offset;
			my $codingSeq = substr($str, $indivStart, $len);
			print("ORF: \t\t" . $seq ."\n");
			$protSeq = translate($codingSeq);
			print("Protein: \t" . $protSeq . "\n\n");
			push(@prots, $protSeq);
		}
	}	
	return @prots;
}


my $str = 'ATGAAATAAAAAATGTTTTTTTGAATGAAAA';


print("Done.\n");

my @proteins = translate_dna($str);

