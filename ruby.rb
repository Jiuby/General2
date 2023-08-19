def is_word_possible(word, letters)
    letter_counts = Hash.new(0)
    letters.chars.each { |char| letter_counts[char] += 1 }
  
    word.chars.each do |char|
      return false unless letter_counts[char] && letter_counts[char] > 0
      letter_counts[char] -= 1
    end
  
    true
  end
  
  def solve(dictionary_path, input_path)
    dictionary = File.readlines(dictionary_path, chomp: true)
    input = File.readlines(input_path, chomp: true)
    test_cases = input[0].to_i
    input_cases = input[1..]
  
    input_cases.each do |case_line|
      word_length, letters = case_line.split(' ')
      count = dictionary.count { |word| word.length == word_length.to_i && is_word_possible(word, letters) }
      print "#{count} "
    end
  
    puts
  end
  
  solve("dictionary.txt", "input.txt") # Reemplaza con los nombres reales de los archivos
  