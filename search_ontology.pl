#!/usr/bin/perl

# Packages
use strict;
use warnings;

# Turn off unusual character print warning
no warnings 'utf8';

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
	Closed-world Assumption (1),
	Open-world Assumption (2) or
	MVP Ontology (3). 
	Enter another number to quit: ";
	chomp(my $ontology = <STDIN>);
	if($ontology=="1") {
		$filename = "Ontologies/thirtySixViewsClosed.owl";
	}elsif($ontology=="2") {
		$filename = "Ontologies/thirtySixViewsOpen.owl";
	}elsif($ontology=="3") { 
		$filename = "Ontologies/thirtySixViewsMVP.owl";
	}else{exit 0;}
	return $filename;
}

# Select search term 
sub get_search{
	print ">>>
	View all classes (1), all individuals (2), all
	object properties (3), all data properties (4)  
	or enter a search term: ";
	chomp($search = <STDIN>);
	exit 0 if ($search eq "");
	if ($search eq "1"){$search = "Class:";}
	if ($search eq "2"){$search = "Individual:";}
	if ($search eq "3"){$search = "ObjectProperty:";}
	if ($search eq "4"){$search = "DataProperty:";}
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
