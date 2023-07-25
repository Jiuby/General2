def main
    option = gets.to_i
  
    case option
    when 1
      # Generate Hamming code
      puts "Enter the data bits"
      data = gets.chomp
      data_bits = data.split.map(&:to_i)
      r = 1
      while data_bits.length + r + 1 > 2**r
        r += 1
      end
      hamming_code = []
      for i in 0..r + data_bits.length - 1
        p = 2**i
        if p == i + 1
          hamming_code.push(0)
        else
          hamming_code.push(data_bits[i])
        end
      end
      for parity in 0..hamming_code.length - 1
        ph = 2**parity
        if ph == parity + 1
          index = ph - 1
          to_xor = []
          for i in index..hamming_code.length - 1 by 2*ph
            to_xor.push(hamming_code[i])
          end
          hamming_code[index] = hamming_code[index] ^ to_xor.inject(:^)
        end
      end
      hamming_code.reverse!
      puts "Hamming code generated would be:- ", hamming_code.join(" ")
  
    when 2
      # Detect error in received Hamming code
      puts "Enter the received Hamming code"
      hamming_code = gets.chomp
      data_bits = hamming_code.split.map(&:to_i)
      parity_list = []
      for parity in 0..hamming_code.length - 1
        ph = 2**parity
        if ph == parity + 1
          parity_list.push(hamming_code[parity])
        end
      end
      parity_list.reverse!
      error = parity_list.inject(:^)
  
      if error == 0
        puts "There is no error in the received Hamming code"
      else
        puts "Error is in #{error} bit"
      end
  
    else
      puts "Option entered does not exist"
    end
  end
  
  main
  