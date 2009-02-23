use inc::Module::Install;
name 'autobox-String-Inflector';
all_from 'lib/autobox/String/Inflector.pm';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
