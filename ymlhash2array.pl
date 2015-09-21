use strict;
use warnings;
use YAML qw(Dump LoadFile DumpFile);

my @files = @ARGV;

#print @files;
for my $file (@files){
	my @yaml = LoadFile($file);

	DumpFile("web/_data/$file", \@yaml);
}
