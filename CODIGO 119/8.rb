def generate_brainfuck_code(N, f0, f1)
    bf_code = ''
  
    # Inicializar celdas de memoria para f0 y f1
    bf_code << '[-]' # Inicializar la celda de memoria en 0
    bf_code << '+' * f0
    bf_code << '>' * f1
  
    # Generar secuencia Fibonacci
    bf_code << '['
    bf_code << '->+[-<+]'
    bf_code << '>' * f1
    bf_code << '<<<<<-]'
    bf_code << '[' + '+' * f1 + '>' * f0 + '<-]>[->+<][>+<-]<[<+>>+<-]>[->+<]'
  
    # Imprimir N valores de la secuencia
    bf_code << '>' * (N - 1)
    bf_code << '['
    bf_code << '>++++++[<++++++++>-]<.[-]<[-]<'
    bf_code << '<' * (N - 1)
    bf_code << '-]'
  
    bf_code
  end
  
  # Ejemplo de uso con N = 5, f0 = 1 y f1 = 3
  N = 5
  f0 = 1
  f1 = 3
  
  bf_code = generate_brainfuck_code(N, f0, f1)
  puts bf_code
  