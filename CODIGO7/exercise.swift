func luckyTickets(n: Int, b: Int) -> Int {
  var luckyTickets = 0
  var maxValue = 1 << n
  for i in 0 ..< maxValue {
    var firstHalf = 0
    var secondHalf = 0
    var j = 0
    while i > 0 {
      let digit = i % b
      firstHalf += digit if j < n / 2
      secondHalf += digit if j >= n / 2
      i >>= 1
      j += 1
    }
    luckyTickets += 1 if firstHalf == secondHalf
  }
  return luckyTickets
}

func main() {
  let n = Int(readLine()!)!
  let b = Int(readLine()!)!
  print(luckyTickets(n: n, b: b))
}

main()
