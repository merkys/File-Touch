#! perl

use strict;
use warnings;

use Test::More 0.88 tests => 1;
use File::Temp;
use File::Touch;

my $dir = File::Temp->newdir;

symlink 'nonexistent', $dir->dirname . '/link';
my $toucher = File::Touch->new(reference => $dir->dirname . '/link', no_dereference => 1);
$toucher->touch('new');
ok 1;
