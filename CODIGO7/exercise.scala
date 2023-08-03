object LuckyTickets {
  def luckyTickets(n: Int, b: Int): Int = {
    var luckyTickets = 0
    for (i <- 0 until (1 << n) - 1) {
      var firstHalf = 0
      var secondHalf = 0
      var j = 0
      while (i > 0) {
        firstHalf += i % b if j < n / 2 else secondHalf += i % b
        i >>= 1
        j += 1
      }
      if (firstHalf == secondHalf) {
        luckyTickets += 1
      }
    }
    luckyTickets
  }

  def main(args: Array[String]) {
    val n = scala.io.StdIn.readInt()
    val b = scala.io.StdIn.readInt()
    println(luckyTickets(n, b))
  }
}
