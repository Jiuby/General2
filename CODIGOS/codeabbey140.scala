fun countOnes(n: Int): Int {
  var count = 0
  for (i in 1..n) {
    for (j in 1..n) {
      if (i == j) {
        count++
      }
    }
  }
  return count
}

fun main(args: Array<String>) {
  val n = readLine()!!.toInt()
  println(countOnes(n))
}
