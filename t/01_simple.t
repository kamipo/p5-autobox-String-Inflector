use strict;
use warnings;
use autobox::String::Inflector;
use Encode ();
use Test::More tests => 4;

is 'users'->singularize->camelize, 'User';
is 'statuses'->singularize->camelize, 'Status';
is 'Entry'->decamelize->pluralize, 'entries';
is 'Status'->decamelize->pluralize, 'statuses';
