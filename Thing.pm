package Data::OFN::Thing;

use strict;
use warnings;

use Mo qw(build default is);
use Mo::utils qw(check_array_object check_isa check_number);
use Mo::utils::IRI 0.02 qw(check_iri);
use Mo::utils::Number qw(check_positive_natural);

our $VERSION = 0.01;

has attachment => (
	default => [],
	is => 'ro',
);

has created => (
	is => 'ro',
);

has description => (
	default => [],
	is => 'ro',
);

has id => (
	is => 'ro',
);

has invalidated => (
	is => 'ro',
);

has iri => (
	is => 'ro',
);

has name => (
	default => [],
	is => 'ro',
);

has relevant_to => (
	is => 'ro',
);

has updated => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'attachment'.
	check_array_object($self, 'attachment', 'Data::OFN::DigitalObject',
		'Digital object');

	# Check 'created'.
	check_isa($self, 'created', 'Data::OFN::Common::TimeMoment');

	# Check 'description'.
	check_array_object($self, 'description', 'Data::Text::Simple', 'Description');

	# Check 'invalidated'.
	check_isa($self, 'invalidated', 'Data::OFN::Common::TimeMoment');

	# Check 'id'.
	check_positive_natural($self, 'id');

	# Check 'iri'.
	check_iri($self, 'iri');

	# Check 'name'.
	check_array_object($self, 'name', 'Data::Text::Simple', 'Name');

	# Check 'relevant_to'.
	check_isa($self, 'relevant_to', 'Data::OFN::Common::TimeMoment');

	# Check 'updated'.
	check_isa($self, 'updated', 'Data::OFN::Common::TimeMoment');

	return;
}

1;

__END__
