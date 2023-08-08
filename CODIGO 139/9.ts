function solveBeamBalanceAndMasses(test_cases: number[]): number[] {
    const masses = [1, 3, 9, 27, 81];
    let results = [];
  
    for (const test_case of test_cases) {
      let power_of_3 = 0;
      while (test_case >= 81) {
        power_of_3++;
        test_case -= 81;
      }
      results.push(masses[power_of_3]);
      test_case -= masses[power_of_3];
    }
  
    return results;
  }
  