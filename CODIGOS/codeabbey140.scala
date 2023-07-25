def countOnes(n: Int): Int = {
  var count = 0
  for (i <- 1 to n) {
    for (j <- 1 to n) {
      if (i == j) {
        count += 1
      }
    }
  }
  count
}

object Main {
  def main(args: Array[String]): Unit = {
    val n = readLine().toInt
    println(countOnes(n))
  }
}
