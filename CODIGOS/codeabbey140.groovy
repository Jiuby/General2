def countOnes(n) {
  count = 0
  for (i in 1..n) {
    for (j in 1..n) {
      if (i == j) {
        count++
      }
    }
  }
  count
}

println countOnes(readLine().toInteger())
