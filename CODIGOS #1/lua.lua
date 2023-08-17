-- Función para desencriptar un mensaje usando XOR
function xor_decrypt(encrypted, key)
    local decrypted = {}
    local key_length = #key

    for i = 1, #encrypted do
        local byte = string.byte(encrypted:sub(i, i)) ~ string.byte(key:sub((i - 1) % key_length + 1, (i - 1) % key_length + 1))
        table.insert(decrypted, byte)
    end

    return string.char(unpack(decrypted))
end

-- Función principal
function main()
    io.write("Ingrese el número de cadenas encriptadas:\n")
    local num_strings = tonumber(io.read())

    io.write("Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):\n")
    local encrypted_input = io.read()
    local encrypted_strings = {}
    for hex in encrypted_input:gmatch("%x+") do
        table.insert(encrypted_strings, tonumber(hex, 16))
    end

    io.write("Ingrese la clave en formato hexadecimal:\n")
    local key_input = io.read()
    local key = {}
    for hex in key_input:gmatch("%x+") do
        table.insert(key, tonumber(hex, 16))
    end

    local decrypted = xor_decrypt(string.char(unpack(encrypted_strings)), string.char(unpack(key)))

    io.write("Mensajes desencriptados:\n")
    io.write(decrypted, "\n")
end

main()
