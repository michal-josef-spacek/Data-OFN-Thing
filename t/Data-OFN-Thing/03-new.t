use strict;
use warnings;

use Data::OFN::Common::TimeMoment;
use Data::OFN::Thing;
use Data::Text::Simple;
use DateTime;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 5;
use Test::NoWarnings;
use Unicode::UTF8 qw(decode_utf8);

# Test.
my $obj = Data::OFN::Thing->new;
isa_ok($obj, 'Data::OFN::Thing');

# Test.
$obj = Data::OFN::Thing->new(
	'attachment' => [],
	'created' => Data::OFN::Common::TimeMoment->new(
		'date' => DateTime->new(
			'day' => 1,
			'month' => 1,
			'year' => 2020,
		),
	),
	'description' => [
		Data::Text::Simple->new(
			'lang' => 'cs',
			'text' => 'Toto je popis',
		),
		Data::Text::Simple->new(
			'lang' => 'en',
			'text' => 'This is description',
		),
	],
	'id' => 7,
	'invalidated' => Data::OFN::Common::TimeMoment->new(
		'date' => DateTime->new(
			'day' => 30,
			'month' => 8,
			'year' => 2024,
		),
	),
	'iri' => 'https://example.com/aktivita',
	'name' => [
		Data::Text::Simple->new(
			'lang' => 'en',
			'text' => 'Name',
		),
		Data::Text::Simple->new(
			'lang' => 'cs',
			'text' => decode_utf8('Jméno'),
		),
	],
	'related_to' => Data::OFN::Common::TimeMoment->new(
		'date' => DateTime->new(
			'day' => 12,
			'month' => 12,
			'year' => 2024,
		),
	),
	'updated' => Data::OFN::Common::TimeMoment->new(
		'date' => DateTime->new(
			'day' => 30,
			'month' => 1,
			'year' => 2025,
		),
	),
);
isa_ok($obj, 'Data::OFN::Thing');

# Test.
eval {
	Data::OFN::Thing->new(
		'id' => 'bad',
	);
};
is($EVAL_ERROR, "Parameter 'id' must be a positive natural number.\n",
	"Parameter 'id' must be a positive natural number (bad).");
clean();

# Test.
eval {
	Data::OFN::Thing->new(
		'iri' => '://foo',
	);
};
is($EVAL_ERROR, "Parameter 'iri' doesn't contain valid IRI.\n",
	"Parameter 'iri' doesn't contain valid IRI (://foo).");
clean();
