import Foundation

func main() {
    let stdin = FileHandle.standardInput
    let n = Int(stdin.readLine()!)!
    var heights = [Int]()
    for _ in 0 ..< n {
        let line = stdin.readLine()!.split(separator: " ")
        let d1 = Int(line[0])!
        let a = Double(line[1])!
        let b = Double(line[2])!
        let h = tan(b) * d1 / (tan(a) - tan(b))
        heights.append(Int(h))
    }
    for h in heights {
        print(h)
    }
}

main()
