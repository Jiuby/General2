# Función para desencriptar un mensaje usando XOR
xor_decrypt <- function(encrypted, key) {
  decrypted <- as.raw(bitwXor(as.integer(encrypted), as.integer(key)))
  return(decrypted)
}

# Función principal
main <- function() {
  cat("Ingrese el número de cadenas encriptadas:\n")
  num_strings <- as.integer(readline())

  cat("Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):\n")
  encrypted_input <- strsplit(readline(), " ")[[1]]
  encrypted_strings <- as.raw(as.hexmode(encrypted_input))

  cat("Ingrese la clave en formato hexadecimal:\n")
  key_input <- strsplit(readline(), " ")[[1]]
  key <- as.raw(as.hexmode(key_input))

  decrypted_strings <- xor_decrypt(encrypted_strings, rep(key, length.out = length(encrypted_strings)))

  cat("Mensajes desencriptados:\n")
  cat(rawToChar(decrypted_strings), "\n")
}

main()
