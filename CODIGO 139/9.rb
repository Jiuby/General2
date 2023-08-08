def solve_beam_balance_and_masses(test_cases)
    masses = [1, 3, 9, 27, 81]
    results = []
  
    test_cases.each do |test_case|
      power_of_3 = 0
      while test_case >= 81
        power_of_3 += 1
        test_case -= 81
      end
      results.push(masses[power_of_3])
      test_case -= masses[power_of_3]
    end
  
    return results
  end
  