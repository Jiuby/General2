fn solve_beam_balance_and_masses(test_cases: Vec<i32>) -> Vec<i32> {
    let masses = vec![1, 3, 9, 27, 81];
    let mut results = vec![];
  
    for test_case in test_cases {
      let mut power_of_3 = 0;
      while test_case >= 81 {
        power_of_3 += 1;
        test_case -= 81;
      }
      results.push(masses[power_of_3]);
      test_case -= masses[power_of_3];
    }
  
    results
  }
  