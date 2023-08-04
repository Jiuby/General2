use strict;
use warnings;

sub cloud_altitude {
  my ($d1, $a, $b) = @_;

  my $h = tan($b) * $d1 / (tan($a) - tan($b));

  return int($h);
}

my $n = <>;

my @heights;
for (1..$n) {
  my @data = split ' ', <>;

  my $d1 = $data[0];
  my $a = $data[1];
  my $b = $data[2];

  push @heights, cloud_altitude($d1, $a, $b);
}

print "@heights\n";
