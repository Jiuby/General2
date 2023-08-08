func solveBeamBalanceAndMasses(test_cases: [Int]) -> [Int] {
  let masses = [1, 3, 9, 27, 81]
  var results = [Int]()

  for test_case in test_cases {
    var powerOf3 = 0
    while test_case >= 81 {
      powerOf3 += 1
      test_case -= 81
    }
    results.append(masses[powerOf3])
    test_case -= masses[powerOf3]
  }

  return results
}
