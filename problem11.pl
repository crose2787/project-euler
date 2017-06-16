#!/usr/bin/perl
#
# Project Euler # 11
# Greatest product of four adjacent numbers in the same direction (up/down, left/right, diagonal) in a 20X20 grid

use strict;
use warnings;
use diagnostics;

# Declare subs if needed
sub checker;

# Each row stored as string element of @lines
my $path = "/var/www/html/test/Project_Euler/prob11grid.txt";
open( my $fh, '<', $path );
chomp( my @lines = <$fh> );
close( $fh );

my @numbers;
foreach my $line ( @lines ) {
	my @splits = split( ' ', $line );
	push( @numbers, @splits );
}

# Create 20x20 multi-dimensional array (ie $grid[0-19][0-19])
my @grid;
my $j = 0;
for ( my $i = 0; $i < @lines; $i++ ) {
	my @row = [
		$numbers[$j], $numbers[$j + 1], $numbers[$j + 2], $numbers[$j + 3], $numbers[$j + 4],
		$numbers[$j + 5], $numbers[$j + 6], $numbers[$j + 7], $numbers[$j + 8], $numbers[$j + 9],
		$numbers[$j + 10], $numbers[$j + 11], $numbers[$j + 12], $numbers[$j + 13], $numbers[$j + 14],
		$numbers[$j + 15], $numbers[$j + 16], $numbers[$j + 17], $numbers[$j + 18], $numbers[$j + 19]
	];

	push( @grid, @row );
	$j = $j + 20;
}

# Horizontal
my $horizontalProduct = 0;
for ( my $i = 0; $i <= 19; $i++ ) {
	for ( my $j = 0; $j <= 19; $j++ ) {
		if ( $j <= 15 ) {
			my @adjacents = [
				$grid[$i][$j],
				$grid[$i][$j + 1],
				$grid[$i][$j + 2],
				$grid[$i][$j + 3],
			];

			my $testProduct = checker(@adjacents);

			if ( $testProduct > $horizontalProduct ) {
				$horizontalProduct = $testProduct;
			}
		} else {
			last;
		}
	}
}

print "# Horizontal Product: " . $horizontalProduct . "\n";

# Vertical
my $verticalProduct = 0;
for ( my $i = 0; $i <= 19; $i++ ) {
	for ( my $j = 0; $j <= 19; $j++ ) {
		if ( $j <= 15 ) {
			my @adjacents = [
				$grid[$j][$i],
				$grid[$j + 1][$i],
				$grid[$j + 2][$i],
				$grid[$j + 3][$i],
			];

			my $testProduct = checker(@adjacents);

			if ( $testProduct > $verticalProduct ) {
				$verticalProduct = $testProduct;
			}
		} else {
			last;
		}
	}
}

print "# Vertical Product: " . $verticalProduct . "\n";

#Desc Diagonal (corrected)
my $descProduct = 0;
for ( my $i = 0; $i <= 19; $i++ ) {
	for ( my $j = 0; $j <= 19; $j++ ) {
		if ( $i <= 16 && $j <= 16) {
			my @adjacents = [
				$grid[$i][$j],
				$grid[$i + 1][$j + 1],
				$grid[$i + 2][$j + 2],
				$grid[$i + 3][$j + 3],
			];

			my $testProduct = checker(@adjacents);

			if ( $testProduct > $descProduct ) {
				$descProduct = $testProduct;
			}
		} else {
			last;
		}
	}
}

print "# Desc Diagonal Product: " . $descProduct . "\n";

# Asc Diagonal (corrected)
my $ascProduct = 0;
for ( my $i = 19; $i >= 0; $i-- ) {
	for ( my $j = 19; $j > 0; $j-- ) {
		if ( $j > 2) {
			my @adjacents = [
 				$grid[$i][$j],
				$grid[$i + 1][$j - 1],
				$grid[$i + 2][$j - 2],
				$grid[$i + 3][$j - 3],
			];

			my $testProduct = checker(@adjacents);

			if ( $testProduct > $ascProduct ) {
				$ascProduct = $testProduct;
			}
		} else {
			last;
		}
	}
}

print "# Asc Diagonal Product: " . $ascProduct . "\n";

sub checker {
	my @array = @_;
	
	my $one = $array[0][0];
	my $two = $array[0][1];
	my $three = $array[0][2];
	my $four = $array[0][3];

	my $product = 0;
	if ( defined( $one ) && defined( $two ) && defined( $three ) && defined( $four ) ) {
		$product = $one * $two * $three * $four;
	}

	return $product;
}