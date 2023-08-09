<?php

function generateBrainfuckCode($N, $f0, $f1) {
    $bfCode = '';

    // Inicializar celdas de memoria para f0 y f1
    $bfCode .= '[-]'; // Inicializar la celda de memoria en 0
    $bfCode .= str_repeat('+', $f0);
    $bfCode .= str_repeat('>', $f1);

    // Generar secuencia Fibonacci
    $bfCode .= '[';
    $bfCode .= '->+[-<+]';
    $bfCode .= str_repeat('>', $f1);
    $bfCode .= '<<<<<-]';
    $bfCode .= '[' . str_repeat('+', $f1) . str_repeat('>', $f0) . '<-]>[->+<][>+<-]<[<+>>+<-]>[->+<]';

    // Imprimir N valores de la secuencia
    $bfCode .= str_repeat('>', $N - 1);
    $bfCode .= '[';
    $bfCode .= '>++++++[<++++++++>-]<.[-]<[-]<';
    $bfCode .= str_repeat('<', $N - 1);
    $bfCode .= '-]';

    return $bfCode;
}

// Ejemplo de uso con N = 5, f0 = 1 y f1 = 3
$N = 5;
$f0 = 1;
$f1 = 3;

$bfCode = generateBrainfuckCode($N, $f0, $f1);
echo $bfCode;
?>
