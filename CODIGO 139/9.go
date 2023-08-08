package main

import (
	"fmt"
	"math"
)

func main() {
	var test_cases []int
	fmt.Scanf("%d", &test_cases)

	var masses []int
	masses = append(masses, 1, 3, 9, 27, 81)

	for _, test_case := range test_cases {
		var power_of_3 int
		for test_case >= 81 {
			power_of_3++
			test_case -= 81
		}
		masses = append(masses, int(math.Pow(3, float64(power_of_3))))
		test_case -= int(math.Pow(3, float64(power_of_3)))
	}

	for _, mass := range masses {
		fmt.Println(mass)
	}
}
