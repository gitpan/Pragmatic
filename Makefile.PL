require 5.005;
use strict;

use ExtUtils::MakeMaker;

WriteMakefile
  (AUTHOR => 'B. K. Oxley (binkley) at Home <binkley@bigfoot.com>',
   ABSTRACT => 'Exporter with pragma support',
   NAME => 'Pragmatic',
   VERSION_FROM => 'lib/Pragmatic.pm');