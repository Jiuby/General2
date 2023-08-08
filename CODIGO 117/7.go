package main

import (
	"fmt"
	"strings"
)

func main() {
	var N int
	fmt.Print("Enter an integer: ")
	fmt.Scan(&N)

	bfCode := generateBrainfuckCode(N)
	fmt.Println("Brainfuck++ Code:")
	fmt.Println(bfCode)
}

func generateBrainfuckCode(N int) string {
	var bfCode strings.Builder

	bfCode.WriteString("++[") // Set the quotient counter to 2
	bfCode.WriteString("->+<") // Move to cell 1 and increment to 1
	bfCode.WriteString("]") // Close the quotient loop

	bfCode.WriteString(">[->>>>+<<<<]") // Copy the quotient to cell 2

	bfCode.WriteString("[") // Start the remainder loop
	bfCode.WriteString("->+<") // Move to cell 3 and increment to 1
	bfCode.WriteString("]") // Close the remainder loop

	bfCode.WriteString(">[->>>>+<<<<]") // Copy the remainder to cell 4

	// Divide by two and update quotient and remainder
	bfCode.WriteString(">>>>[-<+++++>]<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>+[-<+>]>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>+[-<+>]>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<[-<+>]+[-<[->>+<<]>[-<+>]+>[-]<<<<[->>>+<<<]>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<[-<+>]++++[-<+++++++++++>]>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<<<<+[-<+>]>>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<[-<+>]++++[-<+++++++++++>]<.[-]<[-]<")

	return bfCode.String()
}
