#! /usr/bin/perl
#w8_q2.pl

#Document the interface of your RestrictionEnzyme 
#class in POD and add it to the class file.

use warnings;
use strict;
use Exporter qw/import/;
our @EXPORT_OK = qw/ RestrictionEnzyme_pod /;

package RestrictionEnzyme;
use Moose;

#name
has name => (
	is => 'rw',
	isa => "Str",
);
#manufacturer aka commercial availability
has manuf => (
	is => 'rw',
	isa => "Str",
);
#recognition sequence
has recSeq => (
	is => 'rw',
	isa => "Str",
	handles => (
	digestFrags => "digest"
	),
);
#5' overhang
has overhang5 => (
	is => 'rw',
	isa => "Int",
);
#3' overhang
has overhang3 => (
	is => 'rw',
	isa => "Int",
);
#references
has refs => (
	is => 'rw',
	isa => "Str",
);
#cleavage site
has cleaveSite => (
	is => 'rw',
	isa => "Str",
);
#methylation sensitivity
has methSens => (
	is => 'rw',
	isa => "Int",
);
#endonucleases
has endoNucs => (
	is => 'rw',
	isa => "Str",
);

#cut_dna object takes sequence return array of digested fragments
sub cut_dna
{
	my $dna = (@_);
	my $self = shift;
	my $recSeq = $self->recSeq;
	my @digestFrags = split( /\Q$recSeq /, $dna);
	return @digestFrags;
}
1;


=pod
  
=head2 RestrictionEnzyme_pod
	Contains the attributes for restriction enzymes:
	name - name
    manuf - manufacturer(s) (commercial availability)
    recSeq - recognition sequence
    overhang5 - 5' overhang
    overhang3 - 3' overhang
    refs - references
    cleaveSite - cleavage site
    methSens - methylation sensitivity
    reendoNucsfs - endonucleases
  
=head2 cut_dna
  
    digest($dna)
  
    Where $dna is the sequence to be subjected to restriction enzyme digestion per the restriction enzyme of the class.
  
 =cut