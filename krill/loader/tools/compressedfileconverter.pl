#!/usr/bin/env perl

=head1 NAME

compressedfileconverter.pl

=head1 DESCRIPTION

This script converts files compressed by some crunchers
so they can be loaded and decompressed in-place, on the fly.

=head1 SYNOPSIS

  compressedfileconverter.pl [dnx|lc] uncompressed_infile compressed_infile outfile

=cut

use strict;
use warnings;


my %margins = (
    ''    => 0,
    'dnx' => 4,
    'lc'  => 3
);

my $type = '';
if (scalar @ARGV == 4) {
    $type = shift @ARGV;
}

if (!($type ~~ %margins) or (scalar @ARGV != 3)) {
   die "Usage: $0 [dnx|lc] uncompressed_infile compressed_infile outfile\n";
}

my $uncompressed_infile = shift @ARGV;
my $compressed_infile   = shift @ARGV;
my $converted_outfile   = shift @ARGV;


open UNCOMPRESSED, $uncompressed_infile
    or die "\nCan't open uncompressed file $uncompressed_infile for reading: $!\n";
binmode UNCOMPRESSED;

my $uncompressed_address;
read(UNCOMPRESSED, $uncompressed_address, 2);
my $uncompressed_data;
my $uncompressed_size = read(UNCOMPRESSED, $uncompressed_data, 65536);
$uncompressed_address = unpack("S", $uncompressed_address);
close UNCOMPRESSED;


open COMPRESSED, $compressed_infile
    or die "\nCan't open compressed file $compressed_infile for reading: $!\n";
binmode COMPRESSED;

my $compressed_data;
if (!($type eq 'lc')) {
    my $compressed_address;
    read(COMPRESSED, $compressed_address, 2);
}
my $compressed_size = read(COMPRESSED, $compressed_data, 65536);
close COMPRESSED;

open CONVERTED, ">$converted_outfile"
    or die "\nCan't open converted file $converted_outfile for writing: $!\n";
binmode CONVERTED;

my $offset = 0;
my $safety_margin = $margins{$type};
$compressed_size += $offset;
my $converted_address = $uncompressed_address + $uncompressed_size + $safety_margin - $compressed_size;


$converted_address = pack("S", $converted_address);
print CONVERTED $converted_address;
if ($offset) {
    $uncompressed_address = pack("S<", $uncompressed_address);
    print CONVERTED $uncompressed_address;
}
print CONVERTED $compressed_data;
close CONVERTED;

exit 0;
