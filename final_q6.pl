#!/usr/bin/perl

#final_q6.pl

#Use the BioPerl modules to write a script that takes a protein sequence accession number 
#as input (on the command line), then fetches this sequence from GenBank, BLASTs it against 
#the non-redundant database, and then retrieves all the hits that are above a certain 
#e-value cutoff (also given as input on the command line). The retrieved sequences should 
#be written to files, one sequence per file, in the current directory. If no hits satisfy 
#the e-value cutoff, the script should note that instead of writing any files.



use warnings;
#use strict;

use Bio::Perl;
use Bio::Tools::Run::RemoteBlast;

sub doSearch {
  	my ($seq, $expect) = @_;
  	my $factory = Bio::Tools::Run::RemoteBlast->new( -prog       => 'blastp'   ,
                                                 -data       => 'nr'       ,
                                                 -expect     => $expect    ,
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
	      print "\n\tGot results for: ",$output->query_name(),"\n";
      	foreach my $hit ( $output->hits ) {
	        print "HIT TO: ",$hit->name,"\n";
	        foreach my $hsp ( $hit->hsps ) {
	          my $filename = $hit->name . ".out";
	          	my $seq = $hsp->hit_string;
				open (OUTFILE, ">>$filename");
				print OUTFILE $seq;
				close (OUTFILE);
        }
      }
	    }
	    elsif( $result < 0 ) {
	      # some error occurred
	      print "No results found \n";
	      $factory->remove_rid( $rid );
	    }
	    else {
	      print '.';
	      sleep 5;
	    }
	  }
	}
}


my $acc = $ARGV[0];
my $expect = $ARGV[1];

my $seq = get_sequence( "genpept" , $acc );
doSearch($seq, $expect);