#include <iostream>
#include <string>

std::string generateBrainfuckCode(int N, int f0, int f1) {
    std::string bfCode;

    // Inicializar celdas de memoria para f0 y f1
    bfCode += "[-]"; // Inicializar la celda de memoria en 0
    bfCode += std::string("+", f0);
    bfCode += std::string(">", f1);

    // Generar secuencia Fibonacci
    bfCode += "[";
    bfCode += "->+[-<+]";
    bfCode += std::string(">", f1);
    bfCode += "<<<<<-]";
    bfCode += "[" + std::string("+", f1) + std::string(">", f0) + "<-]>[->+<][>+<-]<[<+>>+<-]>[->+<]";

    // Imprimir N valores de la secuencia
    bfCode += std::string(">", N - 1);
    bfCode += "[";
    bfCode += ">++++++[<++++++++>-]<.[-]<[-]<";
    bfCode += std::string("<", N - 1);
    bfCode += "-]";

    return bfCode;
}

int main() {
    int N = 5;
    int f0 = 1;
    int f1 = 3;

    std::string bfCode = generateBrainfuckCode(N, f0, f1);
    std::cout << bfCode << std::endl;

    return 0;
}
