#!/usr/bin/perl
  
use strict;
use warnings;

my @lines; #array of lines copied forming the end document
my $grab_lines = 0; #boolean flag

open INPUTFILE, 'hexagon_bridge.sdb' or die "Couldn't open the input file: $!";

while (<INPUTFILE>) {
        my $line = $_;

        if ($line =~ /^Species: C_vdw/) {#if line contains string send to output
        $grab_lines = 1;
        next;
        }
        if ($line =~ /^Species: B_vdw/) {
        warn "line begins with trace";
        $grab_lines = 0;
        next;
        }
        if($grab_lines)
{
                push(@lines, $line);
        }
}

close INPUTFILE or die $!;

open OUTPUT, '>output_c' or  die "COuldn't open the output file: $!";
print OUTPUT @lines;
print @lines
