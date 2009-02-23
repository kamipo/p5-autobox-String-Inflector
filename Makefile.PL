use inc::Module::Install;
name 'autobox-String-Inflector';
all_from 'lib/autobox/String/Inflector.pm';

requires 'autobox';
requires 'String::CamelCase';
requires 'Lingua::EN::Inflect::Number';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
