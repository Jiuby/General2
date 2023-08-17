fun xorDecrypt(encrypted: ByteArray, key: ByteArray): String {
    val decrypted = ByteArray(encrypted.size)
    val keySize = key.size

    for (i in encrypted.indices) {
        decrypted[i] = (encrypted[i].toInt() xor key[i % keySize].toInt()).toByte()
    }

    return String(decrypted)
}

fun main() {
    println("Ingrese el número de cadenas encriptadas:")
    val numStrings = readLine()?.toIntOrNull() ?: return

    println("Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):")
    val encryptedInput = readLine()?.trim() ?: return
    val encryptedStrings = encryptedInput.split(" ").map { it.toInt(16).toByte() }.toByteArray()

    println("Ingrese la clave en formato hexadecimal:")
    val keyInput = readLine()?.trim() ?: return
    val key = keyInput.split(" ").map { it.toInt(16).toByte() }.toByteArray()

    val decrypted = xorDecrypt(encryptedStrings, key)

    println("Mensajes desencriptados:")
    println(decrypted)
}

fun main(args: Array<String>) {
    main()
}
