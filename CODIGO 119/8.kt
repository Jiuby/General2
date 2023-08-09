fun generateBrainfuckCode(N: Int, f0: Int, f1: Int): String {
    val bfCode = StringBuilder()

    // Inicializar celdas de memoria para f0 y f1
    bfCode.append("[-]") // Inicializar la celda de memoria en 0
    bfCode.append("+".repeat(f0))
    bfCode.append(">".repeat(f1))

    // Generar secuencia Fibonacci
    bfCode.append("[")
    bfCode.append("->+[-<+>]")
    bfCode.append(">".repeat(f1))
    bfCode.append("<<<<<-]")
    bfCode.append("[".plus("+".repeat(f1)).plus(">".repeat(f0)).plus("<-]>[->+<][>+<-]<[<+>>+<-]>[->+<]")

    // Imprimir N valores de la secuencia
    bfCode.append(">".repeat(N - 1))
    bfCode.append("[")
    bfCode.append(">++++++[<++++++++>-]<.[-]<[-]<")
    bfCode.append("<".repeat(N - 1))
    bfCode.append("-]")

    return bfCode.toString()
}

fun main() {
    val N = 5
    val f0 = 1
    val f1 = 3

    val bfCode = generateBrainfuckCode(N, f0, f1)
    println(bfCode)
}
