# Emacs, this is -*- perl -*- code.

BEGIN { use Test; plan tests => 5; }

use Test;

# Test 1:
eval join '', <DATA>;
ok ($@, '');

# Test 2, 3:
eval { import X; };
ok ($@, '');
ok (exists ${::}{abc}, '');

# Test 4, 5:
eval { import X qw (abc); };
ok ($@, '');
ok (exists ${::}{abc}, 1);

__DATA__

package X;

use strict;
use vars qw (@EXPORT_OK @ISA %PRAGMATA);

require Pragmatic;

@EXPORT_OK = qw (abc);

@ISA = qw (Pragmatic);

sub abc { 1; }

1;
