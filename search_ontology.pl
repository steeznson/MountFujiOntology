# /usr/bin/perl 'search_ontology.pl'

# Packages
use strict;
use warnings;

# Global Vars
my $filename; # .owl file
my $search; # search term
my $fh; # file buffer

# Main routine
get_ontology();
open_file();
get_search();
print_output();

# Select ontology sub-routine
sub get_ontology{
	print ">>>
	Which ontology would you like to search?
	Open-world Assumption (1), Open-world Assumption v2 (2),
	Closed-world Assumption (3): ";
	chomp(my $ontology = <STDIN>);
	if($ontology=="1") {
		$filename = "thirtySixViewsOpen.owl";
	}elsif($ontology=="2") {
		$filename = "thirtySixViewsOpen-discrete.owl";
	}elsif($ontology=="3") {
		$filename = "thirtySixViewsClosed.owl";
	}else{exit 0;}
	return $filename;
}

# Select search term 
sub get_search{
	print ">>>
	View all classes (1), all individuals (2),
	all object properties (3) or enter a search term: ";
	chomp($search = <STDIN>);
	exit 0 if ($search eq "");
	if ($search eq "1"){$search = "Class:";}
	if ($search eq "2"){$search = "Individual:";}
	if ($search eq "3"){$search = "ObjectProperty:";}
	return $search;
}

# Open file
sub open_file{
	open ($fh, '<encoding(UTF-8)', $filename)
		or die "Could not open file '$filename' $!";
}

# Print output
sub print_output{
	print ">>>\n"; # output formatting
	while (my $row = <$fh>) {
		chomp $row; 
		print "$row\n" if ($row =~ $search);
	}
}
