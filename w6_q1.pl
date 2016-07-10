#!/usr/bin/perl
#w6_q1.pl

use DBI;


#use strict; 
use warnings;

sub parseFastaFile{
	my ($infile) = @_;                              
	open INFILE, $infile or die "Can't open $infile: $!";        
	my $sequence = ();
	my $header = 0;      
	my $line;                             
	while ($line = <INFILE>) {
	    chomp $line;                     
	    if($line =~ /^\s*$/) {         
	        my ($GeneName, $Org, $Tissue, $Start, $Stop, $ExpLevel) = split('\|', $header);
			$GeneName =~ s/> //;
			$Org =~ s/^\s+|\s+$//g;
			$Tissue =~ s/^\s+|\s+$//g;
			$Start =~ s/^\s+|\s+$//g;
			$Stop =~ s/^\s+|\s+$//g;
			$ExpLevel =~ s/^\s+|\s+$//g;      
			InsertIntoDatabase($GeneName, $Org, $Tissue, $Start, $Stop, $ExpLevel, $sequence); 
	        next;
	    } 
	    elsif($line =~ /^>/) {          
	        $header = $line;
	        next;
	    } else {
	        $sequence .= $line;
	    }
	    $sequence =~ s/\s//g;              
	}
	$sequence =~ s/\s//g;
	my ($GeneName, $Org, $Tissue, $Start, $Stop, $ExpLevel) = split('\|', $header);
	$GeneName =~ s/> //;
	$Org =~ s/^\s+|\s+$//g;
	$Tissue =~ s/^\s+|\s+$//g;
	$Start =~ s/^\s+|\s+$//g;
	$Stop =~ s/^\s+|\s+$//g;
	$ExpLevel =~ s/^\s+|\s+$//g;
	InsertIntoDatabase($GeneName, $Org, $Tissue, $Start, $Stop, $ExpLevel, $sequence);
}

sub CreateDatabase
{
	$dbh = DBI->connect( "dbi:SQLite:data.dbl" ) || die "Cannot connect: $DBI::errstr";
	$dbh->do( "CREATE TABLE ExpressionData ( 'GeneName', 'Org', 'Tissue', 'Start', 'Stop', 'ExpLevel', 'Sequence' )" );
	$dbh->disconnect;
}

sub InsertIntoDatabase
{
	my ($GeneName, $Org, $Tissue, $Start, $Stop, $ExpLevel, $Sequence) = @_;
	$dbh = DBI->connect( "dbi:SQLite:data.dbl" ) || die "Cannot connect: $DBI::errstr";
	$dbh->do( "INSERT INTO ExpressionData ( GeneName, Org, Tissue, Start, Stop, ExpLevel, Sequence ) VALUES (?, ?, ?, ?, ?, ?, ?)", undef, $GeneName, $Org, $Tissue, $Start, $Stop, $ExpLevel, $Sequence);
	$dbh->disconnect;
}

CreateDatabase();
my $fastaInput = "/Users/Jonathan_Erikson/Documents/1_PersonalThings/JHU_Bioinformatics/data.fasta"; 
parseFastaFile($fastaInput);






