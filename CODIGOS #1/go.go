package main

import (
	"bufio"
	"fmt"
	"os"
	"strings"
)

// Función para desencriptar un mensaje usando XOR
func xorDecrypt(encrypted []byte, key []byte) []byte {
	decrypted := make([]byte, len(encrypted))
	keyLength := len(key)

	for i, b := range encrypted {
		decrypted[i] = b ^ key[i%keyLength]
	}

	return decrypted
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	fmt.Println("Ingrese el número de cadenas encriptadas:")
	numStringsStr, _ := reader.ReadString('\n')
	var numStrings int
	fmt.Sscanf(strings.TrimSpace(numStringsStr), "%d", &numStrings)

	fmt.Println("Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):")
	encryptedInput, _ := reader.ReadString('\n')
	encryptedStringsHex := strings.Fields(encryptedInput)
	encryptedStrings := make([]byte, len(encryptedStringsHex))
	for i, hex := range encryptedStringsHex {
		fmt.Sscanf(hex, "%x", &encryptedStrings[i])
	}

	fmt.Println("Ingrese la clave en formato hexadecimal:")
	keyInput, _ := reader.ReadString('\n')
	keyHex := strings.Fields(keyInput)
	key := make([]byte, len(keyHex))
	for i, hex := range keyHex {
		fmt.Sscanf(hex, "%x", &key[i])
	}

	decrypted := xorDecrypt(encryptedStrings, key)

	fmt.Println("Mensajes desencriptados:")
	fmt.Println(string(decrypted))
}
