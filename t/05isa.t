# Emacs, this is -*- perl -*- code.

BEGIN { use Test; plan tests => 5; }

use Test;

# Test 1:
eval join '', <DATA>;
ok ($@, '');

# Test 2, 3:
eval { import X; };
ok ($@, '');
ok (X->physics, 'fun');

# Test 4, 5:
eval { import X qw (-notso); };
ok ($@, '');
ok (X->physics, 'nofun');

__DATA__

package Truth;

sub physics { 'fun'; }


package Untruth;

sub physics { 'nofun'; }


package X;

use strict;
use vars qw (@ISA %PRAGMATA);

require Pragmatic;

@ISA = qw (Pragmatic Truth);

%PRAGMATA =
  (notso => sub {
     @ISA = map { $_ eq 'Truth' and $_ = 'Untruth' } @ISA; });

1;
