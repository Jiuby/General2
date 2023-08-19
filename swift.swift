import Foundation

func isWordPossible(_ word: String, _ letters: String) -> Bool {
    var letterCounts = [Character: Int]()
    for char in letters {
        letterCounts[char, default: 0] += 1
    }

    for char in word {
        if let count = letterCounts[char], count > 0 {
            letterCounts[char] = count - 1
        } else {
            return false
        }
    }

    return true
}

func solve(dictionaryPath: String, inputPath: String) {
    guard let dictionaryContents = try? String(contentsOfFile: dictionaryPath),
          let inputContents = try? String(contentsOfFile: inputPath) else {
        return
    }

    let dictionary = dictionaryContents.components(separatedBy: .newlines)
    let inputLines = inputContents.components(separatedBy: .newlines)
    let testCases = Int(inputLines[0]) ?? 0
    let inputCases = Array(inputLines[1...])

    for caseLine in inputCases {
        let parts = caseLine.split(separator: " ")
        if parts.count >= 2,
           let wordLength = Int(parts[0]),
           let letters = parts[1] {
            let count = dictionary.filter { $0.count == wordLength && isWordPossible($0, letters) }.count
            print("\(count) ")
        }
    }
    print("\n")
}

solve(dictionaryPath: "dictionary.txt", inputPath: "input.txt") // Reemplaza con los nombres reales de los archivos
