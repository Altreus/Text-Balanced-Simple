#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
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
    {
        text => "\n",
    },
]);

$text = <<EOT;
prelim text "double quote" post text
'single quote'
newline text
text before "escaped\\" double quote"
'escaped\\' single quote' text after
EOT

$result = $tb->parse($text);

is_deeply($result, 
[
    {
        text => 'prelim text ',
    },
    {
        text => 'double quote',
        delimiters => ['"', '"'],
    },
    {
        text => " post text\n",
    },
    {
        text => 'single quote',
        delimiters => ["'", "'"],
    },
    {
        text => "\nnewline text\ntext before ",
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
    {
        text => " text after\n",
    },
]);
