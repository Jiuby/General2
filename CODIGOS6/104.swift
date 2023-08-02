import Foundation

func main() {
  let n = Int(readLine()!)!
  var eggs = [Int](repeating: 0, count: 20)
  var touching = [[Int]](repeating: [Int](repeating: 0, count: 20), count: 20)
  var ans = [Int]()
  for i in 0..<n {
    cin >> eggs[i]
  }
  for i in 0..<n {
    for j in 0..<n {
      touching[i][j] = 0
    }
  }
  for i in 0..<n {
    var k = Int(readLine()!)!
    for j in 0..<k {
      let t = Int(readLine()!)!
      touching[i][t] = 1
    }
  }
  var cnt = 0
  for i in 0..<n {
    var flag = true
    for j in 0..<n {
      if eggs[j] == 1 && touching[i][j] == 1 {
        flag = false
        break
      }
    }
    if flag {
      ans.append(i)
    }
  }
  for i in 0..<ans.count {
    print(ans[i])
  }
}
