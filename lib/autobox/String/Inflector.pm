package autobox::String::Inflector;

use strict;
use warnings;
our $VERSION = '0.01';

use base qw(autobox);

sub import {
    shift->SUPER::import(STRING => 'autobox::String::Inflector::Impl', @_);
}

package # hide from pause
    autobox::String::Inflector::Impl;

use String::CamelCase qw(camelize decamelize);
use Lingua::EN::Inflect::Number;

*pluralize = \&Lingua::EN::Inflect::Number::to_PL;

sub singularize {
    local $_ = shift;
    return $_ if s/(alias|status)es$/$1/i;
    return Lingua::EN::Inflect::Number::to_S($_);
}

1;
__END__

=head1 NAME

autobox::String::Inflector -

=head1 SYNOPSIS

  use autobox::String::Inflector;

=head1 DESCRIPTION

autobox::String::Inflector is

=head1 AUTHOR

Ryuta Kamizono E<lt>kamipo@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
