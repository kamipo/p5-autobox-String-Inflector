use strict;
use warnings;
use autobox::String::Inflector;
use Encode ();
use Test::More tests => 2;

is 'users'->singularize->camelize, 'User';
is 'Status'->decamelize->pluralize, 'statuses';
