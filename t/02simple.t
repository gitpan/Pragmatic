# Emacs, this is -*- perl -*- code.

BEGIN { use Test; plan tests => 4; }

use Test;

# Test 1:
eval join '', <DATA>;
ok ($@, '');

# Test 2:
eval { import X qw (-abc); };
ok ($@, '');

# Test 3, 4:
eval { import Y qw (-def); };
ok ($@, '');
ok ($Y::DEBUG, 1);

# Quiet warnings:
$Y::DEBUG || 1;

__DATA__

package X;

use strict;
use vars qw (@ISA %PRAGMATA);

require Pragmatic;

@ISA = qw (Pragmatic);

%PRAGMATA = (abc => sub { 1; });

1;


package Y;

use strict;
use vars qw ($DEBUG @ISA %PRAGMATA);

$DEBUG = 0;

@ISA = qw (X);

%PRAGMATA = (def => sub { $DEBUG = 1; });

1;
