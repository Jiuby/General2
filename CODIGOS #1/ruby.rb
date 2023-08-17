def xor_decrypt(encrypted, key)
    decrypted = encrypted.each_byte.with_index.map do |byte, i|
      (byte ^ key[i % key.length]).chr
    end
    decrypted.join
  end
  
  def main
    puts "Ingrese el número de cadenas encriptadas:"
    num_strings = gets.chomp.to_i
  
    puts "Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):"
    encrypted_strings = gets.chomp.split.map { |hex| hex.to_i(16) }
  
    puts "Ingrese la clave en formato hexadecimal:"
    key = gets.chomp.split.map { |hex| hex.to_i(16) }
  
    decrypted_strings = encrypted_strings.map do |encrypted|
      xor_decrypt(encrypted.to_s(2).rjust(8, '0'), key.to_s(2).rjust(8, '0')).to_i(2)
    end
  
    puts "Mensajes desencriptados:"
    decrypted_strings.each { |decrypted| puts decrypted.chr }
  end
  
  main
  