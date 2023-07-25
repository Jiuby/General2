object Main extends App {
  val option = scala.io.StdIn.readInt()

  def generateHammingCode(data: String): String = {
    val dataBits = data.split(" ").map(_.toInt)
    val r = 1
    while (dataBits.length + r + 1 > scala.math.pow(2, r)) {
      r += 1
    }
    val hammingCode = new Array[Int](r + dataBits.length)
    for (i <- 0 until r + dataBits.length) {
      val p = scala.math.pow(2, i)
      if (p == i + 1) {
        hammingCode(i) = 0
      } else {
        hammingCode(i) = dataBits(i)
      }
    }
    for (parity <- 0 until hammingCode.length) {
      val ph = scala.math.pow(2, parity)
      if (ph == parity + 1) {
        val startIndex = ph - 1
        val toXor = new Array[Int](2 * ph)
        for (i <- startIndex until hammingCode.length by 2 * ph) {
          toXor(i - startIndex) = hammingCode(i)
        }
        hammingCode(startIndex) = toXor.reduce(_ ^ _)
      }
    }
    hammingCode.reverse.mkString(" ")
  }

  def detectErrorInReceivedHammingCode(hammingCode: String): String = {
    val dataBits = hammingCode.split(" ").map(_.toInt)
    val parityList = new Array[Int](hammingCode.length)
    for (parity <- 0 until hammingCode.length) {
      val ph = scala.math.pow(2, parity)
      if (ph == parity + 1) {
        parityList(parity) = dataBits(parity)
      }
    }
    parityList.reverse
    val error = parityList.reduce(_ ^ _)

    if (error == 0) {
      "There is no error in the hamming code received"
    } else {
      "Error is in " + error + " bit"
    }
  }

  option match {
    case 1 =>
      val data = scala.io.StdIn.readLine()
      val hammingCode = generateHammingCode(data)
      println("Hamming code generated would be: " + hammingCode)

    case 2 =>
      val hammingCode = scala.io.StdIn.readLine()
      println(detectErrorInReceivedHammingCode(hammingCode))
  }
}
