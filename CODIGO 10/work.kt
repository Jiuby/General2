fun main(args: Array<String>) {
    val stdin = System.`in`
    val n = stdin.readLine().toInt()
    val heights = mutableListOf<Int>()
    for (i in 0 until n) {
        val line = stdin.readLine().split(" ")
        val d1 = line[0].toInt()
        val a = line[1].toDouble()
        val b = line[2].toDouble()
        val h = tan(b) * d1 / (tan(a) - tan(b))
        heights.add(h.roundToInt())
    }
    heights.forEach { println(it) }
}
