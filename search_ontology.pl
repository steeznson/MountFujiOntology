#! /usr/bin/perl 'search_ontology.pl'

# Packages
use strict;
use warnings;

# Global Vars
my $filename; # .owl file
my $search; # search term
my $fh; # file buffer

# Main routine
do {
	get_ontology();
	open_file();
	get_search();
	print_output();
} while (1); # loop until user exits

# Select ontology sub-routine
sub get_ontology{
	print ">>>
	Which ontology would you like to search?
	Closed-world Assumption (1) or
	Open-world Assumption (2). 
	Enter another number to quit: ";
	chomp(my $ontology = <STDIN>);
	if($ontology=="1") {
		$filename = "thirtySixViewsClosed.owl";
	}elsif($ontology=="2") {
		$filename = "thirtySixViewsOpen.owl";
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
