function main()
    println("Enter the data bits: ")
    data = readline()
    data_bits = split(data, " ")
    r = 1
    while length(data_bits) + r + 1 > 2^r
      r += 1
    end
    hamming_code = Vector{Int}(r + length(data_bits))
    for i in 1:r + length(data_bits)
      p = 2^i
      if p == i + 1
        hamming_code[i] = 0
      else
        hamming_code[i] = parse(Int, data_bits[i - 1])
      end
    end
    for parity in 1:r + length(data_bits)
      ph = 2^parity
      if ph == parity + 1
        index = ph - 1
        to_xor = Vector{Int}(2 * ph)
        for i in index:r + length(data_bits) - 1 by 2 * ph
          to_xor[i - index + 1] = hamming_code[i]
        end
        hamming_code[index] = hamming_code[index] ^ reduce(xor, to_xor)
      end
    end
    println("Hamming code generated would be:- ", join(hamming_code, " "))
  end
  
  main()
  