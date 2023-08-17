# Función para desencriptar un mensaje usando XOR
function xor_decrypt(encrypted::Vector{UInt8}, key::Vector{UInt8})
    decrypted = UInt8[]
    key_length = length(key)

    for (i, byte) in enumerate(encrypted)
        push!(decrypted, byte ⊻ key[(i - 1) % key_length + 1])
    end

    return decrypted
end

# Función principal
function main()
    println("Ingrese el número de cadenas encriptadas:")
    num_strings = parse(Int, readline())

    println("Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):")
    encrypted_input = readline()
    encrypted_strings = [parse(UInt8, hex, base=16) for hex in split(encrypted_input)]

    println("Ingrese la clave en formato hexadecimal:")
    key_input = readline()
    key = [parse(UInt8, hex, base=16) for hex in split(key_input)]

    decrypted = xor_decrypt(encrypted_strings, key)

    println("Mensajes desencriptados:")
    println(String(decrypted))
end

main()
