package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

func isWordPossible(word, letters string) bool {
	letterCounts := make(map[rune]int)

	for _, char := range letters {
		letterCounts[char]++
	}

	for _, char := range word {
		if count, exists := letterCounts[char]; !exists || count <= 0 {
			return false
		}
		letterCounts[char]--
	}

	return true
}

func main() {
	dictionaryFile, err := os.Open("dictionary.txt")
	if err != nil {
		fmt.Println("Error opening dictionary file:", err)
		return
	}
	defer dictionaryFile.Close()

	var dictionary []string
	scanner := bufio.NewScanner(dictionaryFile)
	for scanner.Scan() {
		dictionary = append(dictionary, scanner.Text())
	}

	inputFile, err := os.Open("input.txt")
	if err != nil {
		fmt.Println("Error opening input file:", err)
		return
	}
	defer inputFile.Close()

	scanner = bufio.NewScanner(inputFile)
	scanner.Scan() // Read the number of test cases
	testCases := 0
	fmt.Sscanf(scanner.Text(), "%d", &testCases)

	for i := 0; i < testCases && scanner.Scan(); i++ {
		line := scanner.Text()
		parts := strings.Fields(line)
		wordLength := parts[0]
		letters := parts[1]

		count := 0
		for _, word := range dictionary {
			if len(word) == len(wordLength) && isWordPossible(word, letters) {
				count++
			}
		}

		fmt.Print(count, " ")
	}
	fmt.Println()
}
