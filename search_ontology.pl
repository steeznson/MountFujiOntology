use strict;
use warnings;

my $filename = '36views.owl';

print "View all classes (1) or enter a search term: ";
chomp (my $search = <STDIN>);
exit 0 if ($search eq "");
if ($search eq "1"){$search = "Class:";}

open (my $fh, '<encoding(UTF-8)', $filename)
	or die "Could not open file '$filename' $!";

while (my $row = <$fh>) {
	chomp $row; 
	print "$row\n" if ($row =~ $search);
}
