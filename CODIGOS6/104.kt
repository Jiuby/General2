fun main(args: Array<String>) {
  val n = readLine()!!.toInt()
  val eggs = IntArray(20)
  val touching = Array(20) { IntArray(20) }
  val ans = mutableListOf<Int>()
  for (i in 0 until n) {
    cin >> eggs[i]
  }
  for (i in 0 until n) {
    for (j in 0 until n) {
      touching[i][j] = 0
    }
  }
  for (i in 0 until n) {
    val k = readLine()!!.toInt()
    for (j in 0 until k) {
      val t = readLine()!!.toInt()
      touching[i][t] = 1
    }
  }
  var cnt = 0
  for (i in 0 until n) {
    var flag = true
    for (j in 0 until n) {
      if (eggs[j] == 1 && touching[i][j] == 1) {
        flag = false
        break
      }
    }
    if (flag) {
      ans.add(i)
    }
  }
  for (i in 0 until ans.size) {
    print(ans[i] + " ")
  }
  println()
}
