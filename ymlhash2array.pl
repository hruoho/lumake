use strict;
use warnings;
use YAML qw(Dump LoadFile DumpFile);

my $file = shift;

my @yaml = LoadFile($file);

DumpFile("web/_data/$file", \@yaml);
