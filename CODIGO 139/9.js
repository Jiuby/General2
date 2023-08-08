function solveBeamBalanceAndMasses(test_cases) {
    const masses = [1, 3, 9, 27, 81];
    for (const test_case of test_cases) {
      const power_of_3 = 0;
      while (test_case >= 81) {
        power_of_3++;
        test_case -= 81;
      }
      masses.push(3 ** power_of_3);
      test_case -= 3 ** power_of_3;
    }
    return masses;
  }
  
  if (typeof module === "object" && module.exports) {
    module.exports = solveBeamBalanceAndMasses;
  }
  