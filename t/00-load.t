#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Text::Balanced::Simple' ) || print "Bail out!
";
}

diag( "Testing Text::Balanced::Simple $Text::Balanced::Simple::VERSION, Perl $], $^X" );
