import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class java {
    public static void main(String[] args) throws IOException {
        BufferedReader reader = new BufferedReader(new FileReader("dictionary.txt")); // Cambia "dictionary.txt" al nombre del archivo que descargaste
        List<String> dictionary = new ArrayList<>();
        String line;

        while ((line = reader.readLine()) != null) {
            dictionary.add(line);
        }

        reader.close();

        BufferedReader inputReader = new BufferedReader(new FileReader("input.txt")); // Cambia "input.txt" al nombre del archivo de entrada
        int testCases = Integer.parseInt(inputReader.readLine());

        while (testCases > 0) {
            String[] testCase = inputReader.readLine().split(" ");
            int wordLength = Integer.parseInt(testCase[0]);
            String letters = testCase[1];

            int count = countMatchingWords(dictionary, wordLength, letters);
            System.out.print(count + " ");
            
            testCases--;
        }

        inputReader.close();
    }

    private static int countMatchingWords(List<String> dictionary, int wordLength, String letters) {
        int count = 0;

        for (String word : dictionary) {
            if (word.length() == wordLength && isWordPossible(word, letters)) {
                count++;
            }
        }

        return count;
    }

    private static boolean isWordPossible(String word, String letters) {
        Map<Character, Integer> letterCounts = new HashMap<>();
        
        for (char c : letters.toCharArray()) {
            letterCounts.put(c, letterCounts.getOrDefault(c, 0) + 1);
        }
        
        for (char c : word.toCharArray()) {
            if (!letterCounts.containsKey(c) || letterCounts.get(c) <= 0) {
                return false;
            }
            
            letterCounts.put(c, letterCounts.get(c) - 1);
        }
        
        return true;
    }
}
