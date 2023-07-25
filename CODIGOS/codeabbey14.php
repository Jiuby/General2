<?php

function countOnes($n) {
  $count = 0;
  for ($i = 1; $i <= $n; $i++) {
    for ($j = 1; $j <= $n; $j++) {
      if ($i == $j) {
        $count++;
      }
    }
  }
  return $count;
}

$n = readline("Enter the size of the matrix: ");
echo countOnes($n);

?>
