use std::collections::HashMap;
use std::fs;

fn is_word_possible(word: &str, letters: &str) -> bool {
    let mut letter_counts = HashMap::new();
    for c in letters.chars() {
        *letter_counts.entry(c).or_insert(0) += 1;
    }

    for c in word.chars() {
        if let Some(count) = letter_counts.get_mut(&c) {
            if *count > 0 {
                *count -= 1;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    true
}

fn main() {
    let dictionary_contents = fs::read_to_string("dictionary.txt").expect("Unable to read dictionary file");
    let dictionary: Vec<String> = dictionary_contents.lines().map(|s| s.to_string()).collect();

    let input_contents = fs::read_to_string("input.txt").expect("Unable to read input file");
    let input_lines: Vec<&str> = input_contents.lines().collect();

    let test_cases: usize = input_lines[0].parse().expect("Invalid test cases count");
    
    for input_line in input_lines[1..].iter().take(test_cases) {
        let parts: Vec<&str> = input_line.split_whitespace().collect();
        let word_length: usize = parts[0].parse().expect("Invalid word length");
        let letters = parts[1];

        let count = dictionary.iter()
            .filter(|&&word| word.len() == word_length && is_word_possible(&word, letters))
            .count();

        print!("{} ", count);
    }

    println!();
}
