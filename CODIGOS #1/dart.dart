import 'dart:convert';
import 'dart:io';

// Función para desencriptar un mensaje usando XOR
List<int> xorDecrypt(List<int> encrypted, List<int> key) {
  List<int> decrypted = [];

  for (int i = 0; i < encrypted.length; i++) {
    decrypted.add(encrypted[i] ^ key[i % key.length]);
  }

  return decrypted;
}

void main() {
  final stdin = stdin;
  final stdout = stdout;

  stdout.write('Ingrese el número de cadenas encriptadas:\n');
  final numStrings = int.parse(stdin.readLineSync()!);

  stdout.write('Ingrese las cadenas encriptadas en formato hexadecimal (separado por espacios):\n');
  final encryptedInput = stdin.readLineSync()!;
  final encryptedStrings = encryptedInput.split(' ').map((hex) => int.parse(hex, radix: 16)).toList();

  stdout.write('Ingrese la clave en formato hexadecimal:\n');
  final keyInput = stdin.readLineSync()!;
  final key = keyInput.split(' ').map((hex) => int.parse(hex, radix: 16)).toList();

  final decrypted = xorDecrypt(encryptedStrings, key);

  stdout.write('Mensajes desencriptados:\n');
  stdout.writeln(utf8.decode(decrypted));
}
