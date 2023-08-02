package main

import (
  "bufio"
  "fmt"
  "os"
)

func main() {
  scanner := bufio.NewScanner(os.Stdin)
  n := scanner.Scan()
  if !n {
    return
  }
  eggs := make([]int, 20)
  for i := 0; i < 20; i++ {
    eggs[i] = scanner.Int()
  }
  touching := make([][]int, 20)
  for i := 0; i < 20; i++ {
    touching[i] = make([]int, 20)
  }
  for i := 0; i < 20; i++ {
    n := scanner.Scan()
    if !n {
      return
    }
    for j := 0; j < n; j++ {
      touching[i][scanner.Int()] = 1
    }
  }
  ans := []int{}
  for i := 0; i < 20; i++ {
    flag := true
    for j := 0; j < 20; j++ {
      if eggs[j] == 1 && touching[i][j] == 1 {
        flag = false
        break
      }
    }
    if flag {
      ans = append(ans, i)
    }
  }
  for i := 0; i < len(ans); i++ {
    fmt.Println(ans[i])
  }
}
