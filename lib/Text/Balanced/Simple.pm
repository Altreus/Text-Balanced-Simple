package Text::Balanced::Simple;

use warnings;
use strict;

=head1 NAME

Text::Balanced::Simple - Find delimited parts of strings

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

    use Text::Balanced::Simple;

    my $tb = Text::Balanced::Simple->new({
        delimiters => '|[<',                   # default (
        balance_brackets => 1,                 # default 1
        escape_string => '\\',                 # default \
        prefix => '$',                         # default ''
        postfix => '!',                        # default ''
        combine_delimiters => 1,               # default 0
        balance_combined => 1,                 # default 1});
    ...

=head1 SUBROUTINES/METHODS

=head2 new

Construct a new object. Available options are:

=head3 delimiters

Default (

Example '(|[<' matches (this), |this|, [this] or <this>

This defines the set of delimiters you want to use to I<open> your delimited
string. Don't provide any of your I<closing> delimiters if you are using
balanced brackets. If you do, you will find that your brackets will work
backwards, e.g. if you specify '()' instead of just '(', then ')this(' will
match too.

=head3 balance_brackets

Default 1

If a bracket of any sort is defined in the delimiters string, the equivalent
closing bracket will end the delimited section. Otherwise, the same bracket
again will do so.

=head3 escape_string

Default \

Defines the string used to prevent a delimiter from ending the delimited string.
As a special case, if you set this to undef instead of the empty string, then
rather than turning off this functionality, the delimiter itself will be used;
so a doubled-up delimiter will act as an escaped one.

E.g. C<< escape_string => undef >> and C<< delimiters => q(') >> will mean that
'They''re escaped like this'

=head3 prefix

Unused by default

If set, the provided string must appear immediately adjacent to the opening
delimiter in order for the delimiter to count.  If the prefix is a regex, then
the actual prefix that matched the regex will be returned to the user.

=head3 postfix

Unused by default

If set, the provided string must appear immediately after the closing delimiter,
or else the delimited string is rejected. If the value is a regex, then the
actual value discovered by the parser is returned in the output.

=head3 combine_delimiters

Default 0

If this is a true value, then multiple concurrent opening delimiters are treated
as one delimiter, and the same for closing ones. Beware of possible problems
using this with an undef escape string!

=head3 balance_combined

Default 1

If this is a true value, then the number of closing delimiters discovered when
using combine_delimiters must equal the number of opening delimiters; this
allows the delimiter to appear between the delimiters, even if it is not
escaped.

=cut


=head1 AUTHOR

Alastair McGowan-Douglas, C<< <altreus at perl.org> >>

=head1 BUGS

Please use Github to report bugs: http://github.com/Altreus/Text-Balanced-Simple/issues

=head1 SUPPORT

Figure it oout

=head1 ACKNOWLEDGEMENTS

Lots of nice people are nice and that's cool.

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Alastair McGowan-Douglas.

X11 licence not my responsibility etc.

=cut

1;
