object FibonacciBrainfuck {
  def generateBrainfuckCode(N: Int, f0: Int, f1: Int): String = {
    val bfCode = new StringBuilder()

    // Inicializar celdas de memoria para f0 y f1
    bfCode.append("[-]") // Inicializar la celda de memoria en 0
    bfCode.append("+" * f0)
    bfCode.append(">" * f1)

    // Generar secuencia Fibonacci
    bfCode.append("[")
    bfCode.append("->+[-<+>]")
    bfCode.append(">" * f1)
    bfCode.append("<<<<<-]")
    bfCode.append("[" + "+" * f1 + ">" * f0 + "<-]>[->+<][>+<-]<[<+>>+<-]>[->+<]")

    // Imprimir N valores de la secuencia
    bfCode.append(">" * (N - 1))
    bfCode.append("[")
    bfCode.append(">++++++[<++++++++>-]<.[-]<[-]<")
    bfCode.append("<" * (N - 1))
    bfCode.append("-]")

    bfCode.toString()
  }

  def main(args: Array[String]): Unit = {
    val N = 5
    val f0 = 1
    val f1 = 3

    val bfCode = generateBrainfuckCode(N, f0, f1)
    println(bfCode)
  }
}
