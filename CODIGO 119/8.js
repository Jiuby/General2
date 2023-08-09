function generateBrainfuckCode(N, f0, f1) {
    let bfCode = '';

    // Inicializar celdas de memoria para f0 y f1
    bfCode += '[-]'; // Inicializar la celda de memoria en 0
    bfCode += '+'.repeat(f0);
    bfCode += '>'.repeat(f1);

    // Generar secuencia Fibonacci
    bfCode += '[';
    bfCode += '->+[-<+>]';
    bfCode += '>'.repeat(f1);
    bfCode += '<<<<<-]';
    bfCode += '[' + '+'.repeat(f1) + '>'.repeat(f0) + '<-]>[->+<][>+<-]<[<+>>+<-]>[->+<]';

    // Imprimir N valores de la secuencia
    bfCode += '>'.repeat(N - 1);
    bfCode += '[';
    bfCode += '>++++++[<++++++++>-]<.[-]<[-]<';
    bfCode += '<'.repeat(N - 1);
    bfCode += '-]';

    return bfCode;
}

// Ejemplo de uso con N = 5, f0 = 1 y f1 = 3
const N = 5;
const f0 = 1;
const f1 = 3;

const bfCode = generateBrainfuckCode(N, f0, f1);
console.log(bfCode);
