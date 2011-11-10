use Test::More tests => 8;

BEGIN {
use_ok( 'Table::Wave' );
}

diag( "Testing Table::Wave $Table::Wave::VERSION" );

my $tw = new Table::Wave;
ok(ref $tw eq 'Table::Wave', 'constructor');

is_deeply([$tw->wave(1,2,3,4)], [(1,2,3,4)],    'row1');
is_deeply([$tw->wave(1,2,3,5)], [('','','',5)], 'row2');
is_deeply([$tw->wave(1,6,3,4)], [('',6,3,4)],   'row3');
is_deeply([$tw->wave(1,6,7,4)], [('','',7,4)],  'row4');
is_deeply([$tw->wave(8,6,3,4)], [(8,6,3,4)],    'row5');
is_deeply([$tw->wave(8,6,9,1)], [('','',9,1)],  'row6');
