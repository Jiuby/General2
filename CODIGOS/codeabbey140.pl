func countOnes(n: Int) -> Int {
  var count = 0
  for i in 1...n {
    for j in 1...n {
      if i == j {
        count += 1
      }
    }
  }
  return count
}

func main() {
  let n = Int(readLine()!)!
  print(countOnes(n))
}

main()
