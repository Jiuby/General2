import Foundation

func generateBrainfuckCode(N: Int, f0: Int, f1: Int) -> String {
    var bfCode = ""

    // Inicializar celdas de memoria para f0 y f1
    bfCode += "[-]" // Inicializar la celda de memoria en 0
    bfCode += String(repeating: "+", count: f0)
    bfCode += String(repeating: ">", count: f1)

    // Generar secuencia Fibonacci
    bfCode += "["
    bfCode += "->+[-<+>]"
    bfCode += String(repeating: ">", count: f1)
    bfCode += "<<<<<-]"
    bfCode += "[" + String(repeating: "+", count: f1) + String(repeating: ">", count: f0) + "<-]>[->+<][>+<-]<[<+>>+<-]>[->+<]"

    // Imprimir N valores de la secuencia
    bfCode += String(repeating: ">", count: N - 1)
    bfCode += "["
    bfCode += ">++++++[<++++++++>-]<.[-]<[-]<"
    bfCode += String(repeating: "<", count: N - 1)
    bfCode += "-]"

    return bfCode
}

let N = 5
let f0 = 1
let f1 = 3

let bfCode = generateBrainfuckCode(N: N, f0: f0, f1: f1)
print(bfCode)
