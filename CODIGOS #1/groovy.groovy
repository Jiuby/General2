// Función para desencriptar un mensaje usando XOR
def xorDecrypt(encrypted, key) {
    def decrypted = []

    for (int i = 0; i < encrypted.size(); i++) {
        decrypted.add(encrypted[i] ^ key[i % key.size()])
    }

    return decrypted
}

// Función principal
def main() {
    println "Ingrese el número de cadenas encriptadas:"
    def numStrings = Integer.parseInt(System.console().readLine())

    println "Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):"
    def encryptedInput = System.console().readLine()
    def encryptedStrings = encryptedInput.split(" ").collect { Integer.parseInt(it, 16) as byte }

    println "Ingrese la clave en formato hexadecimal:"
    def keyInput = System.console().readLine()
    def key = keyInput.split(" ").collect { Integer.parseInt(it, 16) as byte }

    def decrypted = xorDecrypt(encryptedStrings, key)

    println "Mensajes desencriptados:"
    println new String(decrypted as byte[])
}

main()
