#!/usr/bin/env perl

=head1 NAME

make-loadersymbolsinc.pl

=head1 DESCRIPTION

This script extracts relevant symbols from a ld65-generated map file.
The resulting include file can be included in third-party assembly source code.

=head1 SYNOPSIS

  make-loadersymbolsinc.pl loader-c64.map > loadersymbols-c64.inc

=cut

use strict;
use warnings;

use English qw( -no_match_vars ); # OS_ERROR etc.


main();

sub main
{
    my $version = $ARGV[0];
    my $project = $ARGV[1];
    my @input = read_file($ARGV[2]);
    my ($diskio_segments, $symbols) = extract_all_symbols(@input);
    print_symbols($version, $project, $diskio_segments, filter_symbols($diskio_segments, $symbols));

    return;
}

sub read_file
{
    my ($filename) = @ARG;

    open(my $fh, '<', $filename)
        or die "cannot read file '$filename': $OS_ERROR";

    my @input = <$fh>;
    close $fh;

    return @input;
}

sub extract_all_symbols
{
    my @input = @ARG;

    my $current_list;
    my %diskio_segments;
    my %symbols;
    foreach my $i (@input) {

        if ($i =~ qr{list.*?:}) {
            $current_list = $i;

        } elsif ($current_list =~ qr{Segment}) {
            # only check against the DISKIO segments
            if ($i =~ qr{(DISKIO\w*)\s+(\w+)\s+(\w+)}) {
                my $label = lc $1;
                $diskio_segments{$label . '_start'} = hex '0x' . $2;
                $diskio_segments{$label . '_end'}   = hex '0x' . $3;
            }

        } elsif ($current_list =~ qr{Exports}) {
            # the exported symbols will be filtered by the DISKIO segments
            if ($i =~ qr{(\w+)\s+(\w+)\s+\w+\s+(\w+)\s+(\w+)}) {
                # double-entry line
                $symbols{$1} = hex '0x' . $2;
                $symbols{$3} = hex '0x' . $4;
            } elsif ($i =~ qr{(\w+)\s+(\w+)\s+\w+}) {
                # single-entry line
                $symbols{$1} = hex '0x' . $2;
            }
        }
    }

    return \%diskio_segments, \%symbols;
}

sub filter_symbols
{
    my ($diskio_segments, $symbols) = @ARG;

    my %filtered_host;
    my %filtered_drive;
    my $decompressor;
    while (my ($name, $address) = each %$symbols) {
        # do not regard *fix/*fix1 symbols, all-caps or *1 (41/71/81) symbols
        if ($address && ($name !~ /fix|fix1|[A-Z]|1$/)) {
            # only symbols in the DISKIO segments are printed
            if ((($address >= $diskio_segments->{diskio_start})
              && ($address <= $diskio_segments->{diskio_end}))

             || (exists($diskio_segments->{diskio_plugin_start})
              && ($address >= $diskio_segments->{diskio_plugin_start})
              && ($address <= $diskio_segments->{diskio_plugin_end}))

             || (($address >= $diskio_segments->{diskio_install_start})
              && ($address <= $diskio_segments->{diskio_install_end}))

             || (($address >= $diskio_segments->{diskio_zp_start})
              && ($address <= $diskio_segments->{diskio_zp_end}))

             || (exists($diskio_segments->{diskio_plugin_zp_start})
              && ($address >= $diskio_segments->{diskio_plugin_zp_start})
              && ($address <= $diskio_segments->{diskio_plugin_zp_end})))
            {
                $filtered_host{$name} = $address;
            }
        } elsif (($name =~ /config_/) || ($name =~ /status_/)) {
            $filtered_host{$name} = $address;
        } elsif (($name =~ /1$/) && ($name !~ /fix1$/)) {
            $filtered_drive{$name} = $address;
        } elsif ($name =~ /DECOMPRESSOR_(\S+)/) {
            $decompressor = $1;
        }
    }

    return \%filtered_host, \%filtered_drive, $decompressor;
}

sub print_symbols
{
    my ($version, $project, $diskio_segments, $host_symbols, $drive_symbols, $decompressor) = @ARG;

    my @host_symbols_sorted_by_address =
        sort { $host_symbols->{$a} <=> $host_symbols->{$b} } keys %{$host_symbols};

    my @drive_symbols_sorted_by_address =
        sort { $drive_symbols->{$a} <=> $drive_symbols->{$b} } keys %{$drive_symbols};

    my $target = ($diskio_segments->{diskio_plugin_start}) ? "customdrivecode" : "prg";
    for (@host_symbols_sorted_by_address) {
        if("save" eq $_ ) {
            $target = "save";
            last;
        }
    }

    chomp(my $datetime = `date -R`);
    print "; repository version " . $version . ", built on " . $datetime . " for project \"" . $project . "\" using\n";
    print "; make PLATFORM=" . $ENV{'_PLATFORM_'} . " " . $target . " INSTALL=" . $ENV{'INSTALL'} . " RESIDENT=" . $ENV{'RESIDENT'};
    unless ($target =~ /prg/) {
        print " TRANSIENT=" . $ENV{'TRANSIENT'}
    }
    print " ZP=" . $ENV{'ZP'} . " PROJECT=" . $ENV{'PROJECT'} . "\n\n";

    print "; configuration\n";
    foreach my $name (sort (keys(%{$host_symbols}))) {
        if ($name =~ /config_/) {
            if ($name =~ /config_DECOMPRESSOR/) {
                print_symbol($name, $host_symbols->{$name}, $decompressor);
            } else {
                print_symbol($name, $host_symbols->{$name});
            }
        }
    }

    print "\n; status codes\n";
    foreach my $name (@host_symbols_sorted_by_address) {
        if ($name =~ /status_/) {
            print_hex_symbol($name, $host_symbols->{$name});
        }
    }

    my $zp_end = $diskio_segments->{diskio_zp_end};
    if (exists($diskio_segments->{diskio_plugin_zp_end})) {
        $zp_end = $diskio_segments->{diskio_plugin_zp_end} > $diskio_segments->{diskio_zp_end} ? $diskio_segments->{diskio_plugin_zp_end} : $diskio_segments->{diskio_zp_end};
    }

    print "\n; zeropage ";
    printf '$%.2x-$%.2x', $diskio_segments->{diskio_zp_start}, $zp_end + 1;
    print "\n";
    print_hex_symbol("loader_zp_first", $host_symbols->{"loader_zp_first"});
    print_segment_symbols($host_symbols, $diskio_segments->{diskio_zp_start}, $zp_end, @host_symbols_sorted_by_address);

    print "\n; install ";
    printf '$%.4x-$%.4x', $diskio_segments->{diskio_install_start} + 2, $diskio_segments->{diskio_install_end} + 1;
    print "\n";
    # only one relevant symbol ("install"), stop after that so that other symbols from overlaying segments (transient) will be printed there instead
    print_segment_symbols($host_symbols, $diskio_segments->{diskio_install_start} + 2, $diskio_segments->{diskio_install_start} + 2, @host_symbols_sorted_by_address);

    print "\n; resident ";
    printf '$%.4x-$%.4x', $diskio_segments->{diskio_start} + 2, $diskio_segments->{diskio_end} + 1;
    print "\n";
    print_segment_symbols($host_symbols, $diskio_segments->{diskio_start} + 2, $diskio_segments->{diskio_end}, @host_symbols_sorted_by_address);

    unless ($target =~ /prg/) {
        if ($diskio_segments->{diskio_plugin_start}) {
            print "\n; transient ";
            printf '$%.4x-$%.4x', $diskio_segments->{diskio_plugin_start} + 2, $diskio_segments->{diskio_plugin_end} + 1;
            print "\n";
            print_segment_symbols($host_symbols, $diskio_segments->{diskio_plugin_start} + 2, $diskio_segments->{diskio_plugin_end}, @host_symbols_sorted_by_address);
        }

        unless ($target =~ /save/) {
           print "\n; drive\n";
           print_drive_symbols($drive_symbols, "41", @drive_symbols_sorted_by_address);
           print "\n";
           print_drive_symbols($drive_symbols, "71", @drive_symbols_sorted_by_address);
           print "\n";
           print_drive_symbols($drive_symbols, "81", @drive_symbols_sorted_by_address);
        }
    }

    return;
}

sub print_segment_symbols
{
    my ($symbols, $start, $end, @symbols_sorted_by_address) = @ARG;

    foreach my $name (@symbols_sorted_by_address) {
        if ($name =~ /config_|status_|loader_zp_first/) {
            next;
        }

        my $address = $symbols->{$name};
        if ($address == 0) {
            next;
        }

        if (($address >= $start)
         && ($address <= $end)) {
            print_hex_symbol($name, $symbols->{$name});

            $symbols->{$name} = 0;
        }
    }

    return;
}

sub print_drive_symbols
{
    my ($symbols, $filter, @symbols_sorted_by_address) = @ARG;

    foreach my $name (@symbols_sorted_by_address) {
        if ($name =~ /$filter$/) {
            print_hex_symbol($name, $symbols->{$name});
        }
    }

    return;
}

sub print_symbol
{
    my ($name, $address) = @ARG;

    my $format = "%-31s = %d%s\n";
    printf $format, $name, $address, $ARG[2] ? "; " . $ARG[2] : "";

    return;
}

sub print_hex_symbol
{
    my ($name, $address) = @ARG;

    my $address_length = ($address < 256) ? '2' : '4';
    my $format = '%-31s = $%.' . $address_length . "x\n";
    printf $format, $name, $address;

    return;
}
