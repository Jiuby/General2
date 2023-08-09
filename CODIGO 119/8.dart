package main

import (
	"fmt"
	"strings"
)

func main() {
	N := 5
	f0 := 1
	f1 := 3

	bfCode := generateBrainfuckCode(N, f0, f1)
	fmt.Println(bfCode)
}

func generateBrainfuckCode(N, f0, f1 int) string {
	var sb strings.Builder

	// Inicializar celdas de memoria para f0 y f1
	sb.WriteString("[-]") // Inicializar la celda de memoria en 0
	sb.WriteString(fmt.Sprintf("+%s", strings.Repeat("+", f0)))
	sb.WriteString(fmt.Sprintf(">%s", strings.Repeat("+", f1)))

	// Generar secuencia Fibonacci
	sb.WriteString("[")
	sb.WriteString(fmt.Sprintf->+[-<+>]"))
	sb.WriteString(fmt.Sprintf(">>%s", strings.Repeat("+", f1)))
	sb.WriteString("<<<<<-]")
	sb.WriteString(fmt.Sprintf("[%s>%s<-]>[->+<]", strings.Repeat("+", f1), strings.Repeat("+", f0)))
	sb.WriteString("[>+<-]<[<+>>+<-]>[->+<]")

	// Imprimir N valores de la secuencia
	sb.WriteString(fmt.Sprintf(">%s", strings.Repeat(">", N-1)))
	sb.WriteString("[")
	sb.WriteString(">++++++[<++++++++>-]<.[-]<[-]<")
	sb.WriteString(fmt.Sprintf(">%s", strings.Repeat("<", N-1)))
	sb.WriteString("-]")

	return sb.String()
}
