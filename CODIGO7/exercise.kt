fun luckyTickets(n: Int, b: Int): Int {
    var luckyTickets = 0
    var maxValue = 1 shl n
    for (i in 0 until maxValue) {
      var firstHalf = 0
      var secondHalf = 0
      var j = 0
      while (i > 0) {
        val digit = i % b
        firstHalf += digit if j < n / 2 else secondHalf += digit
        i shr 1
        j++
      }
      luckyTickets++ if (firstHalf == secondHalf)
    }
    return luckyTickets
  }
  
  fun main(args: Array<String>) {
    val n = readLine()!!.toInt()
    val b = readLine()!!.toInt()
    println(luckyTickets(n, b))
  }
  