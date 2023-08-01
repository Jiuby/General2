object ChordsOfMusic {
  def determineChordName(notes: List[Int]): String = {
    val steps = notes.sliding(2).map { case List(a, b) => (b - a + 12) % 12 }.toList

    if (steps.contains(3) && steps.contains(4)) {
      "other"
    } else if (steps.contains(4)) {
      getChordName(notes.head, isMajor = true)
    } else if (steps.contains(3)) {
      getChordName(notes.head, isMajor = false)
    } else {
      "other"
    }
  }

  def getChordName(rootNote: Int, isMajor: Boolean): String = {
    val noteNames = List("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
    val rootNoteName = noteNames(rootNote % 12)
    if (isMajor) {
      s"${rootNoteName}-major"
    } else {
      s"${rootNoteName}-minor"
    }
  }

  def main(args: Array[String]): Unit = {
    val numTestCases = scala.io.StdIn.readInt()

    for (_ <- 1 to numTestCases) {
      val inputNotes = scala.io.StdIn.readLine().split(" ").map(_.toInt).toList
      val chordName = determineChordName(inputNotes)
      print(s"$chordName ")
    }
  }
}
