#! /opt/perl/bin/perl
#w5_q2_b.pl
  
#use strict;
use warnings;

#Write a CGI that lets a user choose between generating a random 
#50 nucleotide DNA sequence or a random 50 amino acid protein 
#sequence. Let the user run the programs as many times as she wants.


use CGI (':standard');
  
  my $title = 'Choose a 50nt DNA sequence or 50aa protein sequence';
  print header,
    start_html( $title ),
    h1( $title );
  
  # handle processing of form if this is a submission
  if( param( 'submit' )) {
    my $seq  = param( 'Seq' );
  
  	my $sequence = "";
  	if ($seq eq "nucleotide")
  	{
  		my $sequence = random_ntsequence(50);
  	}
  	else
  	{
  		my $sequence = random_aasequence(50);
  	}
  
  
    print  p( "You chose $seq.\n"),
    p("The sequence is: " . $sequence . "\n"), '<ul>';

  
    print '</ul>',
      hr();
  }

  my $url = url();
  print start_form( -method => 'GET' , action => $url ),
    p( "What's your sequence choice: "  . radio_group( -name   => 'Seq' ,
                                           -values => [ 'nucleotide' , 'amino acid' ] )),

    p( submit( -name => 'submit' , value => 'Submit' )),
    end_form(),
    end_html();

my @bases = qw/ A C G T /;
my @aa = qw/ G P A V L I M C F Y W H K R Q N E  D S T /;
my $length = 50;
  
sub random_ntsequence {
    my( $length , $random_length ) = @_;
    my $return;
    if ( $random_length ) {
      $length = int( rand( $length ));
    }
    foreach ( 1 .. $length ) {
      $return .= $bases[int(rand(4))];
    }
    return $return;
  }    
    
sub random_aasequence {
    my( $length , $random_length ) = @_;
    my $return;
    if ( $random_length ) {
      $length = int( rand( $length ));
    }
    foreach ( 1 .. $length ) {
      $return .= $bases[int(rand(20))];
    }
    return $return;
  }   
    
    
    
    
    
  