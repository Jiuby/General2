defmodule FourPicsOneWord do
  def is_word_possible(word, letters) do
    letter_counts = Enum.frequencies(letters)

    word
    |> String.graphemes()
    |> Enum.reduce(letter_counts, fn char, acc ->
      count = Map.get(acc, char, 0)
      if count > 0 do
        Map.update!(acc, char, count, &(&1 - 1))
      else
        acc
      end
    end)
    |> Map.keys()
    |> length() == 0
  end

  def solve(dictionary_path, input_path) do
    dictionary = File.read!(dictionary_path) |> String.split("\n")
    input = File.read!(input_path) |> String.split("\n")

    {test_cases, rest} = input
                    |> hd()
                    |> String.split()
                    |> Enum.map(&String.to_integer/1)
                    |> List.pop()

    input
    |> Enum.take(test_cases)
    |> Enum.map(&String.split/1)
    |> Enum.each(fn [word_length, letters] ->
      count = Enum.count(dictionary, fn word ->
        String.length(word) == String.to_integer(word_length) && is_word_possible(word, letters)
      end)
      IO.write(count)
      IO.write(" ")
    end)
    IO.puts()
  end
end

FourPicsOneWord.solve("dictionary.txt", "input.txt") # Reemplaza con los nombres reales de los archivos
