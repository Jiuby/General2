sub main () {
  my $n = <>;
  my $count = 0;

  for 1 .. $n {
    my @row = <>;
    for @row {
      if $_ == 1 {
        $count++;
      }
    }
  }

  say $count;
}
