#! /usr/bin/perl
#RestrictionEnzyme.pm

#Using Moose, write a simple RestrictionEnzyme class. 
#Object attributes should include (but not be limited to) name, 
#manufacturer, and recognition sequence. The class should also have a 
#cut_dna object method that takes a sequence as an argument and 
#returns an array of digested DNA fragments.

use warnings;
use strict;

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