import scala.io.Source

object Main {
  def main(args: Array[String]): Unit = {
    val eggs = Source.fromFile("input.txt").getLines().flatMap(_.split(" ")).map(_.toInt)
    val touching = Array.fill(20)(Array.fill(20)(0))

    for (i <- 0 until 20) {
      val line = Source.fromFile("input.txt").getLines().next().split(" ")
      val eggIndex = line(0).toInt
      val neighbors = line.drop(1).map(_.toInt)
      touching(eggIndex)(neighbors: _*) = 1
      touching(neighbors: _*)(eggIndex) = 1
    }

    val ans = for (i <- 0 until 20) yield {
      if (all(eggs != 1 | touching(i).exists(_ == 1))) i
    }

    println(ans.mkString(" "))
  }
}
