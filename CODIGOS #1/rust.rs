use std::io;

fn xor_decrypt(encrypted: u8, key: u8) -> u8 {
    encrypted ^ key
}

fn main() {
    println!("Ingrese el número de cadenas encriptadas:");
    let mut num_strings = String::new();
    io::stdin().read_line(&mut num_strings).expect("Error al leer la entrada");
    let num_strings: usize = num_strings.trim().parse().expect("Entrada inválida");

    println!("Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):");
    let mut encrypted_input = String::new();
    io::stdin().read_line(&mut encrypted_input).expect("Error al leer la entrada");
    let encrypted_strings: Vec<u8> = encrypted_input
        .trim()
        .split_whitespace()
        .map(|hex| u8::from_str_radix(hex, 16).expect("Valor hexadecimal inválido"))
        .collect();

    println!("Ingrese la clave en formato hexadecimal:");
    let mut key_input = String::new();
    io::stdin().read_line(&mut key_input).expect("Error al leer la entrada");
    let key: Vec<u8> = key_input
        .trim()
        .split_whitespace()
        .map(|hex| u8::from_str_radix(hex, 16).expect("Valor hexadecimal inválido"))
        .collect();

    let decrypted_strings: Vec<u8> = encrypted_strings
        .iter()
        .enumerate()
        .map(|(i, &encrypted)| xor_decrypt(encrypted, key[i % key.len()]))
        .collect();

    println!("Mensajes desencriptados:");
    for decrypted in decrypted_strings {
        print!("{}", decrypted as char);
    }
}
