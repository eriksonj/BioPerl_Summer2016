#!/usr/bin/perl
#w11_q1.pl
  
  use warnings;
  
  use CGI (':standard');
  use LWP::Simple;
  
  my $title = 'w11_q1.pl';
  print header,
    start_html( $title ),
    h1( $title );
  
  # handle processing of form if this is a submission
  if( param( 'submit' )) {
    my $query = param( 'query' );
    
  my $utils = "http://www.ncbi.nlm.nih.gov/entrez/eutils";
  my $esearch = "$utils/esearch.fcgi?" .
                "term=";
  my $esearch_result = get($esearch . $query);
  $esearch_result =~ m|<eSearchResult><Count>(\d+)</Count>.*<RetMax>(\d+)</RetMax>.*<RetStart>(\S+)</RetStart>|s;
  my $Count    = $1;
  print "Search Hit Count = $Count \n";
    print p( "Search Hit Count = $Count "),
      '<ul>';
    print '</ul>',
      hr();
  }
  
  # and then print out the base form regardless of whether this is the
  # first time or the tenth
  my $url = url();
  print start_form( -method => 'GET' , action => $url ),
    p( "What's your query: " . textfield( -name => 'query' )),
    p( submit( -name => 'submit' , value => 'Submit' )),
    end_form(),
    end_html();