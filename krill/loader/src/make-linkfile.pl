#!/usr/bin/env perl

my $platform = $ARGV[0];

my $zp = hex($ARGV[1]);
my $install = hex($ARGV[2]);
my $resident = hex($ARGV[3]);
my $transient = hex($ARGV[4]);

printf ("MEMORY
{
 ZPRAM: start = \$%x, size = \$%x;
 ZPRAM2: start = \$%x, size = \$%x;
 INSTALLRAM: start = \$%x, size = \$%x, file = \"../build/install-$platform.prg\";
 RESIDENTRAM: start = \$%x, size = \$%x, file = \"../build/loader-$platform.prg\";
 TRANSIENTRAM: start = \$%x, size = \$%x, file = \"../build/transient-$platform.prg\";
}

SEGMENTS
{
 DISKIO_ZP: load = ZPRAM, type = zp;
 DISKIO_PLUGIN_ZP: load = ZPRAM2, type = zp, optional = yes;
 DISKIO: load = RESIDENTRAM;
 DISKIO_PLUGIN: load = TRANSIENTRAM, optional = yes;
 DISKIO_INSTALL: load = INSTALLRAM;
}
",
$zp, 0x0100 - $zp,
$zp, 0x0100 - $zp,
$install - 2, 0x10002 - $install,
$resident - 2, 0x10002 - $resident,
$transient - 2, 0x10002 - $transient);
