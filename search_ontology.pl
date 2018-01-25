use strict;
use warnings;

my $filename = '36viewsMANCHESTER.owl';

print "Enter search term: ";
chomp (my $search = <STDIN>);
exit 0 if ($search eq "");

open (my $fh, '<encoding(UTF-8)', $filename)
	or die "Could not open file '$filename' $!";

while (my $row = <$fh>) {
	chomp $row; 
	print "$row\n" if ($row =~ $search);
}
