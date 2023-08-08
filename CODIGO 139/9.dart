import 'dart:math';

void main() {
  final test_cases = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85];
  final masses = solveBeamBalanceAndMasses(test_cases);
  for (final mass in masses) {
    print(mass);
  }
}

List<int> solveBeamBalanceAndMasses(List<int> test_cases) {
  final masses = [1, 3, 9, 27, 81];
  for (final test_case in test_cases) {
    var power_of_3 = 0;
    while (test_case >= 81) {
      power_of_3++;
      test_case -= 81;
    }
    masses.add(pow(3, power_of_3));
    test_case -= pow(3, power_of_3);
  }
  return masses;
}
