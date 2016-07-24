#! /usr/bin/perl
#w8_q3.pl

#Write the same class as in problem 1, using "old school" Perl 
#object-oriented programming (i.e., no Moose). Make sure you 
#support all the same methods as the Moose class offers -- the 
#API of this module should be exactly the same as the one in question 1.


use warnings;
use strict;

use strict;
use warnings;

package RestrictionEnzyme_old;

our $AUTOLOAD;




# class attribs
{
  my %_attrib_props = (
    _name       	=> [ 'unknown' , 'read.required' ] ,
    _manuf   		=> [ 'unknown' , 'read.write' ] ,
    _recSeq 		=> [ 'unknown' , 'read.write'    ] ,
    _overhang5     	=> [ 'unknown' , 'read.write'    ] ,
    _overhang3     	=> [ 'unknown' , 'read.write'    ] ,
    _refs       	=> [ 'unknown' , 'read.write'    ] ,
    _cleaveSite     => [ 'unknown' , 'read.write'    ] ,
    _methSens       => [ 'unknown' , 'read.write'    ] ,
    _refs	        => [ 'unknown' , 'read.write'    ] ,
    _endoNucs	    => [ 'unknown' , 'read.write'    ] ,
  );

  # keep track of how many objects we've created.
  my $_count = 0;

  sub _all_attributes { return keys %_attrib_props }

  sub _permissions {
    my( $self , $attrib , $perms ) = ( @_ );
    return $_attrib_props{$attrib}[1] =~ /$perms/;
  }

  sub _default_value {
    my( $self , $attrib ) = ( @_ );
    return $_attrib_props{$attrib}[0];
  }

  sub get_count   { return $_count }
  sub _incr_count { $_count++ }
  sub _decr_count { $_count-- }
}

# constructor
sub new {
  my( $class , %args ) = ( @_ );
  my $self = bless {} , $class;

  foreach my $attrib ( $self->_all_attributes() ) {
    my( $arg ) = $attrib =~ /^_(.*)/;
    if( exists $args{$arg} ) {
      $self->{$attrib} = $args{$arg};
    }
    elsif( $self->_permissions( $attrib , 'required' )) {
      die( "Required $arg attribute missing." );
    }
    else {
      $self->{$attrib} = $self->_default_value($attrib);
    }
  }

  $class->_incr_count();
  return $self;
}

sub AUTOLOAD {
  my( $self , $new ) = ( @_ );

  no strict 'refs';

  die "Can't autoload $AUTOLOAD" unless
    my( $op , $attrib ) = $AUTOLOAD =~ /(get|set)(_\w+)$/;

  die "'$attrib' doesn't exist"
    unless( exists $self->{$attrib} );

  if( $op eq 'get' ) {
    die "no read perms on '$attrib'" unless
      $self->_permissions( $attrib , 'read' );

    # munge symbol table
    *{$AUTOLOAD} = sub {
      my( $self ) = ( @_ );
      die "no read perms on '$attrib'" unless
        $self->_permissions( $attrib , 'read' );
      return $self->{$attrib};
    };
  }

  elsif( $op eq 'set' ) {
    die "no write perms on '$attrib'" unless
      $self->_permissions( $attrib , 'write' );

    $self->{$attrib} = $new;

    # munge symbol table
    *{$AUTOLOAD} = sub {
      my( $self , $new ) = ( @_ );
      die "no write perms on '$attrib'" unless
        $self->_permissions( $attrib , 'write' );
      return $self->{$attrib} = $new;
    };
  }

  use strict 'refs';

  return $self->{$attrib};
}

sub DESTROY {
  my( $self ) = ( @_ );
  $self->_decr_count();
}



sub setname {
    my ( $self, $name ) = @_;
    $self->{_name} = $name if defined($name);
    return $self->{_name};
}
sub getname {
    my( $self ) = @_;
    return $self->{_name};
}

sub setmanuf {
    my ( $self, $manuf ) = @_;
    $self->{_manuf} = $manuf if defined($manuf);
    return $self->{_manuf};
}
sub getmanuf {
    my( $self ) = @_;
    return $self->{_manuf};
}

sub setrecSeq {
    my ( $self, $recSeq ) = @_;
    $self->{_recSeq} = $recSeq if defined($recSeq);
    return $self->{_recSeq};
}
sub getrecSeq {
    my( $self ) = @_;
    return $self->{_recSeq};
}

sub setoverhang5 {
    my ( $self, $overhang5 ) = @_;
    $self->{_overhang5} = $overhang5 if defined($overhang5);
    return $self->{_overhang5};
}
sub getoverhang5 {
    my( $self ) = @_;
    return $self->{_overhang5};
}

sub setoverhang3 {
    my ( $self, $overhang3 ) = @_;
    $self->{_overhang3} = $overhang3 if defined($overhang3);
    return $self->{_overhang3};
}
sub getoverhang3 {
    my( $self ) = @_;
    return $self->{_overhang3};
}

sub setrefs {
    my ( $self, $refs ) = @_;
    $self->{_refs} = $refs if defined($refs);
    return $self->{_refs};
}
sub getrefs {
    my( $self ) = @_;
    return $self->{_refs};
}

sub setcleaveSite {
    my ( $self, $cleaveSite ) = @_;
    $self->{_cleaveSite} = $cleaveSite if defined($cleaveSite);
    return $self->{_cleaveSite};
}
sub getcleaveSite {
    my( $self ) = @_;
    return $self->{_cleaveSite};
}

sub setmethSens {
    my ( $self, $methSens ) = @_;
    $self->{_methSens} = $methSens if defined($methSens);
    return $self->{_methSens};
}
sub getmethSens {
    my( $self ) = @_;
    return $self->{_methSens};
}

sub setendoNucs {
    my ( $self, $endoNucs ) = @_;
    $self->{_endoNucs} = $endoNucs if defined($endoNucs);
    return $self->{_endoNucs};
}
sub getendoNucs {
    my( $self ) = @_;
    return $self->{_endoNucs};
}



sub digest {
  	my( $self , $dna , $recSeq ) = ( @_ );
  	$self->{_recSeq} = setrecSeq( $recSeq );
	my @digestFrags = split( /\Q$recSeq /, $dna);
	return @digestFrags;
}



# use me
1;