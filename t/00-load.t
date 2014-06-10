#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;

plan tests => 2;

BEGIN {
    use_ok( 'BeagleBone::GPIO' ) || print "Bail out!\n";
    use_ok( 'BeagleBone::GPIO::Pin' ) || print "Bail out!\n";
}

diag( "Testing BeagleBone::GPIO $BeagleBone::GPIO::VERSION, Perl $], $^X" );
