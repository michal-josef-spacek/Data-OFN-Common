package Data::OFN::Common::TimeMoment;

use strict;
use warnings;

use Error::Pure qw(err);
use Mo qw(build is);
use Mo::utils 0.08 qw(check_bool check_isa);

our $VERSION = 0.01;

has date => (
	is => 'ro',
);

has date_and_time => (
	is => 'ro',
);

has flag_unspecified => (
	is => 'ro',
);

sub BUILD {
	my $self = shift;

	# Check date.
	check_isa($self, 'date', 'DateTime');
	if (defined $self->{'date'}) {
		if ($self->date->hour != '0') {
			err "Parameter 'date' must have a hour value of zero.";
		}
		if ($self->date->minute != '0') {
			err "Parameter 'date' must have a minute value of zero.";
		}
		if ($self->date->second != '0') {
			err "Parameter 'date' must have a second value of zero.";
		}
	}

	# Check date_and_time.
	check_isa($self, 'date_and_time', 'DateTime');
	if (defined $self->date_and_time
		&& $self->date_and_time->hour == 0
		&& $self->date_and_time->minute == 0
		&& $self->date_and_time->second == 0) {

		err "Parameter 'date_and_time' should be a 'date' parameter.";
	}

	if (defined $self->date && defined $self->date_and_time) {
		err "Parameters 'date' and 'date_and_time' could not be defined together.";
	}

	# Check flag_unspecified.
	check_bool($self, 'flag_unspecified');

	if (defined $self->date && $self->{'flag_unspecified'}) {
		err "Parmaeter 'date' and 'flag_unspecified' could not be defined together.";
	}
	if (defined $self->date_and_time && $self->{'flag_unspecified'}) {
		err "Parmaeter 'date_and_time' and 'flag_unspecified' could not be defined together.";
	}
	if (defined $self->flag_unspecified && ! $self->flag_unspecified
		&& ! defined $self->date
		&& ! defined $self->date_and_time) {

		err "Parameter 'flag_unspecified' disabled needs to be with 'date' or 'date_and_time' parameters.";
	}

	return;
}

1;
