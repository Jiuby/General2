sub main {
  my $option = <>;

  given ($option) {
    when 1 {
      # Generate Hamming code
      print "Enter the data bits\n";
      my $data = <>;
      my @data_bits = split //, $data;
      my $r = 1;
      while (@data_bits + $r + 1 > 2 ** $r) {
        $r++;
      }
      my @hamming_code;
      for (my $i = 0; $i < $r + @data_bits; $i++) {
        my $p = 2 ** $i;
        if ($p == $i + 1) {
          push @hamming_code, 0;
        } else {
          push @hamming_code, $data_bits[$i];
        }
      }
      for (my $parity = 0; $parity < $r + @data_bits; $parity++) {
        my $ph = 2 ** $parity;
        if ($ph == $parity + 1) {
          my $index = $ph - 1;
          my @to_xor;
          for (my $i = $index; $i < $r + @data_bits; $i += 2 * $ph) {
            push @to_xor, $hamming_code[$i];
          }
          $hamming_code[$index] = $hamming_code[$index] ^ sum(@to_xor);
        }
      }
      print "Hamming code generated would be:- ", join " ", @hamming_code, "\n";
    }
    when 2 {
      # Detect error in received Hamming code
      print "Enter the received Hamming code\n";
      my $hamming_code = <>;
      my @data_bits = split //, $hamming_code;
      my @parity_list;
      for (my $parity = 0; $parity < $r + @data_bits; $parity++) {
        my $ph = 2 ** $parity;
        if ($ph == $parity + 1) {
          push @parity_list, $hamming_code[$parity];
        }
      }
      my $error = sum(@parity_list);

      if ($error == 0) {
        print "There is no error in the received Hamming code\n";
      } else {
        print "Error is in bit $error\n";
      }
    }
    else {
      print "Option entered does not exist\n";
    }
  }
}

main();
