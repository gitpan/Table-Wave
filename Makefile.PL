use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Table::Wave',
    AUTHOR              => 'Stefan Adams <stefan@cogentinnovators.com>',
    VERSION_FROM        => 'lib/Table/Wave.pm',
    ABSTRACT_FROM       => 'lib/Table/Wave.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'version'    => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Table-Wave-*' },
);
