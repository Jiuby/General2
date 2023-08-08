function solveBeamBalanceAndMasses(array $test_cases) {
  $masses = [1, 3, 9, 27, 81];
  $result = [];

  foreach ($test_cases as $test_case) {
    $power_of_3 = 0;
    while ($test_case >= 81) {
      $power_of_3++;
      $test_case -= 81;
    }
    $result[] = $masses[$power_of_3];
    $test_case -= $masses[$power_of_3];
  }

  return $result;
}
