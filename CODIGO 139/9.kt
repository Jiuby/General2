fun solveBeamBalanceAndMasses(test_cases: List<Int>): List<Int> {
    val masses = listOf(1, 3, 9, 27, 81)
    val result = mutableListOf<Int>()
  
    for (test_case in test_cases) {
      var powerOf3 = 0
      while (test_case >= 81) {
        powerOf3++
        test_case -= 81
      }
      result.add(masses[powerOf3])
      test_case -= masses[powerOf3]
    }
  
    return result
  }
  