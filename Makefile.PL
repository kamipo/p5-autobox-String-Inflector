use strict;
use warnings;

BEGIN {
    my @devmods = qw(
        Module::Install::AuthorTests
        Module::Install::ReadmeFromPod
        Module::Install::Repository
    );
    my @not_available;

    {
        local *STDOUT;
        eval qq{use inc::Module::Install; 1;} or push @not_available, 'inc::Module::Install';
    }

    for my $mod (@devmods) {
        eval qq{require $mod} or push @not_available, $mod;
    }
    if (@not_available) {
        print qq{# The following modules are not available.\n};
        print qq{# `$^X $0 | cpanm` will install them:\n};
        print $_, "\n" for @not_available;
        print "\n";
        exit -1;
    }
}

use inc::Module::Install;
$Module::Install::AUTHOR = 0 if $ENV{TRAVIS};

name 'autobox-String-Inflector';
all_from 'lib/autobox/String/Inflector.pm';

requires 'autobox';
requires 'String::CamelCase';
requires 'Lingua::EN::Inflect::Number';

test_requires 'Test::More', 0.96;

tests 't/*.t';
author_tests 'xt';

repository 'https://github.com/kamipo/p5-autobox-String-Inflector';
bugtracker 'https://github.com/kamipo/p5-autobox-String-Inflector/issues';

WriteAll;
