# Emacs, this is -*- perl -*- code.

BEGIN { use Test; plan tests => 5; }

use Test;

# Test 1:
eval join '', <DATA>;
ok ($@, '');

# Test 2, 3:
eval { import X qw (-abc); };
ok ($@, '');
ok ($X::DEBUG, 0);

# Test 4, 5:
eval { import X qw (-abc=fox); };
ok ($@, '');
ok ($X::DEBUG, 'fox');

__DATA__

package X;

use strict;
use vars qw ($DEBUG @ISA %PRAGMATA);

require Pragmatic;

$DEBUG = 0;

@ISA = qw (Pragmatic);

%PRAGMATA = (abc => sub { $DEBUG = $_[1] || 0; 1; });

1;
