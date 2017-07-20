#!/usr/bin/perl
#
# Euler Problem # 12
# Value of first triangle number to have over 500 divisors
#
# Time to run the program is way too long, revist, about 27 hours

use strict;
# In order to print during runtime without waiting for buffer
use IO::Handle;
STDOUT->autoflush(1);

print "\n";
print "# Time started: " . localtime();

my @naturals;
my $triangle = 0;
my $count = 1; # nth Triangle Number
my $state = 1;
my $milestone = 100;

do {
	# Summation of @naturals
	$triangle += $count;

	# Use @naturals to find % = 0 and save as @divisors
	my @divisors;
	for ( my $i = $triangle; $i > 0; $i-- ) {
		my $mod = $triangle % $i;

		if ( $mod == 0 ) {
			push ( @divisors, $i );
		}
	}

	# Check for location in program since running time is taking hours
	if ( @divisors > $milestone ) {
		print "\n# Milestone $milestone reached at " . localtime();
		$milestone += 100;
	}

	# Check @divisor count for desired amount
	if ( @divisors > 500 ) {
		$state = 0;
		print "\n";
		print "# Time completed: " . localtime() . "\n";
		print "# nth Triangle: $count\n";
		print "# Triangle Number: $triangle\n";
		print "# Total Divisors: " . @divisors . "\n\n";
	} else {
		# Increase count by one
		++$count;
	}
} while ( $state );
