# Crear un código Hamming

hamming <- function(data) {
  r <- 1
  while (length(data) + r + 1 > 2^r) {
    r <- r + 1
  }
  hamming_code <- vector(mode = "numeric", length = r + length(data))
  for (i in 1:(r + length(data))) {
    p <- 2^i
    if (p == i + 1) {
      hamming_code[i] <- 0
    } else {
      hamming_code[i] <- data[i - 1]
    }
  }
  for (parity in 1:(r + length(data))) {
    ph <- 2^parity
    if (ph == parity + 1) {
      index <- ph - 1
      to_xor <- vector(mode = "numeric", length = 2 * ph)
      for (i in index:(length(hamming_code) - 1) by 2 * ph) {
        to_xor[i - index + 1] <- hamming_code[i]
      }
      hamming_code[index] <- hamming_code[index] ^ sum(to_xor)
    }
  }
  hamming_code
}

# Detectar un error en un código Hamming recibido

detect_error <- function(hamming_code) {
  parity_list <- vector(mode = "numeric", length = length(hamming_code))
  for (parity in 1:(length(hamming_code))) {
    ph <- 2^parity
    if (ph == parity + 1) {
      parity_list[parity] <- hamming_code[parity]
    }
  }
  error <- sum(parity_list)
  if (error == 0) {
    "No hay error en el código Hamming recibido"
  } else {
    "El error está en el bit " + as.character(error)
  }
}

# Entrada de usuario

option <- as.integer(readline("Introduzca la opción: "))
if (option == 1) {
  data <- readline("Introduzca los bits de datos: ")
  data_bits <- strsplit(data, " ")[[1]]
  hamming_code <- hamming(data_bits)
  print("El código Hamming generado sería: ", hamming_code)
} else if (option == 2) {
  hamming_code <- readline("Introduzca el código Hamming recibido: ")
  error <- detect_error(hamming_code)
  print(error)
} else {
  print("La opción introducida no existe")
}
