use Test::More tests => 2;

BEGIN {
use_ok( 'Table::Wave' );
}

diag( "Testing Table::Wave $Table::Wave::VERSION" );

my $tw = new Table::Wave;
ok(ref $tw eq 'Table::Wave', 'constructor');
