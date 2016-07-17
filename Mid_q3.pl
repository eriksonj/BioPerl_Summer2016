##!/usr/bin/perl
#Midterm Q3
#Mid_q3.pl



#Write a Perl program to convert temperatures from Fahrenheit to Celsius and Celsius to 
#Fahrenheit. (User should be asked what scale input is in and program should act accordingly.)

use strict;
use warnings;
use Math::Round;

 print "Enter temperature: \n";
  my $temp = <stdin>;
  chomp( $temp );
  
  print "Enter scale (F or C): \n";
  my $scale = <stdin>;
  chomp( $scale );
  
  $scale = lc $scale;
  
  if ($scale eq "f" )
  {
  	my $output = ($temp - 32) * ( 5 / 9);
  	print ( "\nConverted Temperature is: " . nearest(.01, $output) . " C\n");
  }
  else
  {
  	my $output = ($temp * ( 9 / 5 )) + 32;
  	print ( "\nConverted Temperature is: " . nearest(.01, $output) . " F\n");
  }
  
