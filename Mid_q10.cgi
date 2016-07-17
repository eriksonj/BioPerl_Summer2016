








#Write a CGI to provide web-based search of your database, as in the question last week. 
#Allow repeated searches from the single form. Allow queries on gene name, organism, 
#tissue type, expression level, or any combination of these attributes. (Assume all input 
#is combined with AND; you don't need to support OR .... yet.)

 #! /opt/perl/bin/perl
  
  use warnings;
  use strict;
  use Modern::Perl;
  use DBI;
  
  use CGI (':standard');
  
  my $title = 'Parsing the database';
  print header,
    start_html( $title ),
    h1( $title );
  
  if( param( 'submit' )) {
    my $geneName = param( 'geneName' );
    my $organism  = param( 'organism' );
    my $tissueType  = param( 'tissuetype' );
    my $expressionLevel  = param( 'expressionLevel' );
    
    #setting for wildcard character in case of empty string
  	if ($geneName = "")
  	{
  		$geneName = '%';
  	}
  	if ($organism = "")
  	{
  		$organism = '%';
  	}
  	if ($tissueType = "")
  	{
  		$tissueType = '%';
  	}
  	if ($expressionLevel = "")
  	{
  		$expressionLevel = '%';
  	}
  
  
  	my $dbh = DBI->connect( "DBI:SQLite:dbname=dbfile" , "" , "" , { PrintError => 0 , RaiseError => 1 } );
  	
	my $st = <<EOSQL;
	SELECT genes.g_id, genes.name, genes.organism, genes.seq , genes.tissue , genes.exp_level, genes.orf_start, genes.orf_stop, genes.seq  
	FROM genes WHERE genes.name = geneName AND genes.organism = organism 
	AND genes.exp_level = expressionLevel AND genes.tissue = tissueType
	EOSQL
	
	
	my $sth = $dbh->prepare( $st );
	$sth->execute();
	
	
	while( my @row = $sth->fetchrow_array() ) {
	  print p("Gene Name:  '%s' \n Organism:  '%s' \n Sequence:  '%s' \n 
	  Tissue:  '%s' \n Expression Level:  '%s' \n 
	  Orf Start:  '%s' \n Orf Stop:  '%s' \n 
	  Sequence:  '%s' \n" , @row), '<ul>';
	}
    print '</ul>',
      hr();
  }
  
  # and then print out the base form regardless of whether this is the
  # first time or the tenth
  my $url = url();
  print start_form( -method => 'GET' , action => $url ),
    p( "Gene Name: " . textfield( -name => 'geneName' )),
    p( "Organism: "  . textfield( -name => 'organism' )),
    p( "Tissue Type: "  . textfield( -name => 'tissueType' )),
    p( "Expression Level: " . ( -name => 'expressionLevel' )),
    p( submit( -name => 'submit' , value => 'Submit' )),
    end_form(),
    end_html();