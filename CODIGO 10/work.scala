object CloudAltitudeMeasurement {

  def main(args: Array[String]): Unit = {
    val n = scala.io.StdIn.readLine().toInt

    val heights = for (i <- 0 until n) yield {
      val d1, a, b = scala.io.StdIn.readLine().split(" ").map(_.toDouble)

      val h = tan(b) * d1 / (tan(a) - tan(b))

      Math.round(h).toInt
    }

    println(heights.mkString(" "))
  }
}
