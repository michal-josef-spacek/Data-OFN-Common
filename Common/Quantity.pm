package Data::OFN::Common::Quantity;

use strict;
use warnings;

use Mo qw(build is);
use Mo::utils qw(check_required);
use Mo::utils::CEFACT qw(check_cefact_unit);
use Mo::utils::Number qw(check_number);

our $VERSION = 0.01;

has value => (
	is => 'ro',
);

has unit => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check 'value'.
	check_required($self, 'value');
	check_number($self, 'value');

	# Check 'unit'.
	check_required($self, 'unit');
	check_cefact_unit($self, 'unit');

	return;
}

1;
