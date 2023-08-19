const fs = require('fs');

// Lee el archivo de diccionario y lo convierte en un array de palabras
const dictionary = fs.readFileSync('dictionary.txt', 'utf-8').split('\n');

// Lee el archivo de entrada y lo convierte en un array de casos de prueba
const input = fs.readFileSync('input.txt', 'utf-8').split('\n');
const testCases = parseInt(input[0]);

// Función para verificar si una palabra es posible con las letras dadas
function isWordPossible(word, letters) {
    const letterCounts = new Map();

    for (const char of letters) {
        letterCounts.set(char, (letterCounts.get(char) || 0) + 1);
    }

    for (const char of word) {
        if (!letterCounts.has(char) || letterCounts.get(char) <= 0) {
            return false;
        }

        letterCounts.set(char, letterCounts.get(char) - 1);
    }

    return true;
}

// Procesa los casos de prueba y muestra los resultados
for (let i = 1; i <= testCases; i++) {
    const [wordLength, letters] = input[i].split(' ');
    let count = 0;

    for (const word of dictionary) {
        if (word.length === parseInt(wordLength) && isWordPossible(word, letters)) {
            count++;
        }
    }

    process.stdout.write(count + ' ');
}
