<?php

function main() {
  $option = readline();

  switch ($option) {
    case 1:
      // Generate Hamming code
      echo "Enter the data bits\n";
      $data = readline();
      $data_bits = explode(" ", $data);
      $r = 1;
      while (count($data_bits) + $r + 1 > pow(2, $r)) {
        $r++;
      }
      $hamming_code = array();
      for ($i = 0; $i < $r + count($data_bits); $i++) {
        $p = pow(2, $i);
        if ($p == $i + 1) {
          $hamming_code[] = 0;
        } else {
          $hamming_code[] = $data_bits[$i];
        }
      }
      for ($parity = 0; $parity < $r + count($data_bits); $parity++) {
        $ph = pow(2, $parity);
        if ($ph == $parity + 1) {
          $index = $ph - 1;
          $to_xor = array();
          for ($i = $index; $i < $r + count($data_bits); $i += 2 * $ph) {
            $to_xor[] = $hamming_code[$i];
          }
          $hamming_code[$index] = $hamming_code[$index] ^ array_sum($to_xor);
        }
      }
      echo "Hamming code generated would be:- ", implode(" ", $hamming_code), "\n";
      break;
    case 2:
      // Detect error in received Hamming code
      echo "Enter the received Hamming code\n";
      $hamming_code = readline();
      $data_bits = explode(" ", $hamming_code);
      $parity_list = array();
      for ($parity = 0; $parity < $r + count($data_bits); $parity++) {
        $ph = pow(2, $parity);
        if ($ph == $parity + 1) {
          $parity_list[] = $hamming_code[$parity];
        }
      }
      $error = array_sum($parity_list);

      if ($error == 0) {
        echo "There is no error in the received Hamming code\n";
      } else {
        echo "Error is in bit $error\n";
      }
      break;
    default:
      echo "Option entered does not exist\n";
  }
}

main();
