use strict;
use warnings;

use Data::OFN::Common::Quantity;
use English;
use Error::Pure::Utils qw(clean);
use Test::More 'tests' => 4;
use Test::NoWarnings;

# Test.
my $obj = Data::OFN::Common::Quantity->new;
isa_ok($obj, 'Data::OFN::Common::Quantity');

# Test.
$obj = Data::OFN::Common::Quantity->new(
	'value' => 10,
	'unit' => 'KGM',
);
isa_ok($obj, 'Data::OFN::Common::Quantity');

# Test.
eval {
	Data::OFN::Common::Quantity->new(
		'value' => 10,
		'unit' => 'XXX',
	);
};
is($EVAL_ERROR, "UN/CEFACT unit common code isn't valid.\n",
	"UN/CEFACT unit common code isn't valid (XXX).");
clean();
