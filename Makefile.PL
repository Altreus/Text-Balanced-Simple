use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Text::Balanced::Simple',
    AUTHOR              => q{Alastair McGowan-Douglas <altreus@perl.org>},
    VERSION_FROM        => 'lib/Text/Balanced/Simple.pm',
    ABSTRACT_FROM       => 'lib/Text/Balanced/Simple.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'x11')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Text-Balanced-Simple-*' },
);
