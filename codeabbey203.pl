use strict;
use warnings;

sub main {
  my $n = <>;
  my @m = ();
  for (1 .. $n) {
    my @row = <>;
    push @m, @row;
  }

  my $count = 0;
  for (1 .. $n) {
    for (1 .. $n) {
      if ($m[$_][$_] == 1) {
        $count++;
      }
    }
  }

  print $count;
}

main();
