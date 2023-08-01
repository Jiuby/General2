package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	var numTestCases int
	fmt.Scanln(&numTestCases)

	scanner := bufio.NewScanner(os.Stdin)
	for i := 0; i < numTestCases; i++ {
		scanner.Scan()
		inputNotes := strings.Fields(scanner.Text())
		notes := make([]int, len(inputNotes))
		for j, note := range inputNotes {
			notes[j], _ = strconv.Atoi(note)
		}

		chordName := determineChordName(notes)
		fmt.Printf("%s ", chordName)
	}
}

func determineChordName(notes []int) string {
	steps := make([]int, len(notes)-1)
	for i := 1; i < len(notes); i++ {
		diff := (notes[i] - notes[i-1] + 12) % 12
		steps[i-1] = diff
	}

	if contains(steps, 3) && contains(steps, 4) {
		return "other"
	} else if contains(steps, 4) {
		return getChordName(notes[0], true)
	} else if contains(steps, 3) {
		return getChordName(notes[0], false)
	} else {
		return "other"
	}
}

func getChordName(rootNote int, isMajor bool) string {
	noteNames := []string{"C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"}
	rootNoteName := noteNames[rootNote%12]
	if isMajor {
		return fmt.Sprintf("%s-major", rootNoteName)
	}
	return fmt.Sprintf("%s-minor", rootNoteName)
}

func contains(arr []int, target int) bool {
	for _, num := range arr {
		if num == target {
			return true
		}
	}
	return false
}
