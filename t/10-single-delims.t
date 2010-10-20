#!/usr/bin/perl

use strict;
use warnings;

use Test::More qw(no_plan);

use Text::Balanced::Simple;

my $tb = Text::Balanced::Simple->new({
    delimiters => q('"),
});

my $text = <<EOT;
"double quote"
'single quote'
"escaped\\" double quote"
'escaped\\' single quote'
EOT

my $result = $tb->parse($text);

is_deeply($result, 
[
    {
        text => 'double quote',
        delimiters => ['"', '"'],
    },
    {
        text => "\n",
    },
    {
        text => 'single quote',
        delimiters => ["'", "'"],
    },
    {
        text => "\n",
    },
    {
        text => 'escaped" double quote',
        delimiters => ['"', '"'],
    },
    {
        text => "\n",
    },
    {
        text => "escaped' single quote",
        delimiters => ["'", "'"],
    },
]);
