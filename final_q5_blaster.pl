#!/usr/bin/perl

#Write 'blaster' -- a program which uses RemoteBlast and takes input like this:
#
#  $ ./blaster blastn dna $accession_number $ ./blaster tblastn protein $accession_number 
#  $ ./blaster blastp protein  $accession_number  
#and so on. First argument should be any type of search that is valid via RemoteBlast;
# second argument should be 'dna' or 'protein'. Program should detect when the two arguments 
# don't match (e.g., 'blastp dna') and report the error. Output should be written to a file 
# in the local directory, named for the query sequence and the search algorithm.

use warnings;
#use strict;

use Bio::Perl;
use Bio::Tools::Run::RemoteBlast;

sub doSearch {
  	my ($seq, $blastType) = @_;
  	
  	my $factory = Bio::Tools::Run::RemoteBlast->new( -prog       => $blastType   ,
                                                 -data       => 'nr'       ,
                                                 -expect     => '1e-10'    ,
                                                 -readmethod => 'SearchIO' );
	$factory->submit_blast( $seq );
	print "polling for results";
	my $foundHit = 0;
	my $newAcc;
	while( my @rids = $factory->each_rid ) {
	foreach my $rid ( @rids ) {
	    my $result = $factory->retrieve_blast( $rid );
	    if( ref( $result )) {
	      my $output   = $result->next_result();
	      my $filename = $output->query_name().".out";
	      $factory->save_output( $filename );
	      $factory->remove_rid( $rid );
	      print "\n\tGot ",$output->query_name(),"\n";
	    }
	    elsif( $result < 0 ) {
	      # some error occurred
	      $factory->remove_rid( $rid );
	    }
	    else {
	      print '.';
	      sleep 5;
	    }
	  }
	}
}


my $searchType=$ARGV[0];
my $blastType=$ARGV[1];
my $acc=$ARGV[2];


if (($searchType eq "protein") and ($blastType eq "blastp"))
{
	my $seq = get_sequence( "genpept" , $acc );
	doSearch($seq, $blastType);
}
elsif (($searchType eq "protein") and ($blastType eq "tblastn")) 
{
	my $seq = get_sequence( "genpept" , $acc );
	doSearch($seq, $blastType);
}
elsif (($searchType eq "dna") and ($blastType eq "blastn")) 
{
	my $seq = get_sequence( "genbank" , $acc );
	print $seq;
	doSearch($seq, $blastType);
}
else
{
	print "Wrong query entered - will now abort. \n";
}

