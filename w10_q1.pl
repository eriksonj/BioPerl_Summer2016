#! /usr/bin/perl

#Write a script which prompts the user for an accession number, 
#does a BLAST search of the corresponding sequence, retrieves 
#the top non-self hit (i.e., the best hit that is not the sequence 
#being BLASTed), does a BLAST search with that, and prints out information 
#(accession, GI, name, species, etc.) from the top non-self hit of the second 
#BLAST search. If the top non-self hit from the second search is the same as the 
#original sequence provided as input, your program should note this in the output.



use warnings;
#use strict;

use Bio::Perl;
use Bio::Tools::Run::RemoteBlast;

my $db  = 'genpept';
$acc = 'XP_641993.1';

#blast search the sequence
my $seq = get_sequence( $db , $acc );

#query and get the seqIO using that option

my $factory = Bio::Tools::Run::RemoteBlast->new( -prog       => 'blastp'   ,
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
      my $output = $result->next_result();
      $factory->remove_rid( $rid );
      print "\n";
      foreach my $hit ( $output->hits ) {
      	foreach my $hsp ( $hit->hsps ) {
	      	if ($hsp->percent_identity < 100)
	      	{
	      		print "HIT TO: ", $hit->name,"\n";
	      		$newAcc = substr $hit->name, 4, -1; 
	      		print("new acc: " . $newAcc . "\n");
	      		print("sequence " . $hsp->hit_string . "\n	");
	      		
	      		$foundHit = 1;
	      		last;
	      	}
      	}
        if ($foundHit == 1)
	     {
	      	last;
	     }
        
      }
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


$seq = get_sequence( $db , $newAcc );

#query and get the seqIO using that option

$factory = Bio::Tools::Run::RemoteBlast->new( -prog       => 'blastp'   ,
                                                 -data       => 'nr'       ,
                                                 -expect     => '1e-10'    ,
                                                 -readmethod => 'SearchIO' );

$factory->submit_blast( $seq );

print "polling for results";

$foundHit = 0;


while( my @rids = $factory->each_rid ) {
  foreach my $rid ( @rids ) {
my $result = $factory->retrieve_blast( $rid );
    if( ref( $result )) {
      my $output = $result->next_result();
      $factory->remove_rid( $rid );
      print "\n";
      foreach my $hit ( $output->hits ) {
      	foreach my $hsp ( $hit->hsps ) {
	      	if ($hsp->percent_identity < 100)
	      	{
	      		print "HIT TO: ", $hit->name,"\n";
	      		$newAcc = substr $hit->name, 4, -1; 
	      		print("new acc: " . $newAcc . "\n");
	      		print("sequence " . $hsp->hit_string . "\n	");
	      		
	      		$foundHit = 1;
	      		last;
	      	}
      	}
        if ($foundHit == 1)
	     {
	      	last;
	     }
        
      }
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
if ($foundHit == 0)
{
	print("No non-identical hits were found.")
}
else
{
	my $seq = get_sequence( $db , $newAcc );
	my $name      = $seq->display_id;
	my $accession = $seq->accession_number;
	my $sequence  = $seq->seq;
	my $first_ten = $seq->subseq( 1 , 10 );
	my $length      = $seq->length;
	#my $pid      = $seq->pid;
	my $species      = $seq->species;
	my $keywords      = $seq->keywords;
	my $primary_id      = $seq->primary_id;
	my $id =  $newAcc;
	

    print "
NAME: $name
 ACC: $accession
 TEN: $first_ten
 Length: $length
 Species: $species
 Keywords: $keywords
 Primary ID: $primary_id
 ID: $id

";
}


