use strict;
use warnings;

use Test::NoWarnings;
use Test::Pod::Coverage 'tests' => 2;

# Test.
pod_coverage_ok('Data::OFN::Common::Quantity', 'Data::OFN::Common::Quantity is covered.');
