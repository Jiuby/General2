def solveBeamBalanceAndMasses(test_cases: List[Int]): List[Int] = {
  val masses = List(1, 3, 9, 27, 81)
  val result = ListBuffer[Int]()

  test_cases.foreach { test_case =>
    var power_of_3 = 0
    while (test_case >= 81) {
      power_of_3 += 1
      test_case -= 81
    }
    result += masses(power_of_3)
    test_case -= masses(power_of_3)
  }

  result.toList
}
