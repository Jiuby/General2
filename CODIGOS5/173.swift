func determineChordName(notes: [Int]) -> String {
    var steps = [Int]()
    for i in 1..<notes.count {
        let diff = (notes[i] - notes[i - 1] + 12) % 12
        steps.append(diff)
    }

    if steps.contains(3) && steps.contains(4) {
        return "other"
    } else if steps.contains(4) {
        return getChordName(rootNote: notes[0], isMajor: true)
    } else if steps.contains(3) {
        return getChordName(rootNote: notes[0], isMajor: false)
    } else {
        return "other"
    }
}

func getChordName(rootNote: Int, isMajor: Bool) -> String {
    let noteNames = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"]
    let rootNoteName = noteNames[rootNote % 12]
    if isMajor {
        return "\(rootNoteName)-major"
    } else {
        return "\(rootNoteName)-minor"
    }
}

func main() {
    guard let numTestCasesStr = readLine(),
          let numTestCases = Int(numTestCasesStr) else {
        return
    }

    for _ in 1...numTestCases {
        guard let inputNotesStr = readLine() else {
            return
        }
        let inputNotes = inputNotesStr.split(separator: " ").compactMap { Int($0) }
        let chordName = determineChordName(notes: inputNotes)
        print("\(chordName) ", terminator: "")
    }
}

main()
