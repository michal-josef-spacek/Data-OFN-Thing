use strict;
use warnings;

use Data::OFN::Common::TimeMoment;
use Data::OFN::Thing;
use DateTime;
use Test::More 'tests' => 3;
use Test::NoWarnings;

# Test.
my $obj = Data::OFN::Thing->new;
is($obj->invalidated, undef, 'Get invalidated (undef - default).'),

# Test.
$obj = Data::OFN::Thing->new(
	'invalidated' => Data::OFN::Common::TimeMoment->new(
		'date' => DateTime->new(
			'day' => 1,
			'month' => 1,
			'year' => 2020,
		),
	),
);
isa_ok($obj->invalidated, 'Data::OFN::Common::TimeMoment');
