import scala.io.Source

object FourPicsOneWord {
  def isWordPossible(word: String, letters: String): Boolean = {
    val letterCounts = letters.groupBy(identity).mapValues(_.length)
    
    word.forall { char =>
      letterCounts.getOrElse(char, 0) > 0 && {
        letterCounts(char) -= 1
        true
      }
    }
  }

  def main(args: Array[String]): Unit = {
    val dictionary = Source.fromFile("dictionary.txt").getLines().toList
    val input = Source.fromFile("input.txt").getLines().toList
    val testCases = input.head.toInt
    val inputCases = input.tail

    for (caseLine <- inputCases) {
      val Array(wordLength, letters) = caseLine.split(" ")
      val count = dictionary.count(word => word.length == wordLength.toInt && isWordPossible(word, letters))
      print(s"$count ")
    }

    println()
  }
}
