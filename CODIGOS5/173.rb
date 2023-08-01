def determine_chord_name(notes)
    steps = []
    (1...notes.length).each do |i|
      diff = (notes[i] - notes[i - 1] + 12) % 12
      steps << diff
    end
  
    return 'other' if steps.include?(3) && steps.include?(4)
  
    if steps.include?(4)
      return get_chord_name(notes[0], true)
    elsif steps.include?(3)
      return get_chord_name(notes[0], false)
    else
      return 'other'
    end
  end
  
  def get_chord_name(root_note, is_major)
    note_names = %w[C C# D D# E F F# G G# A A# B]
    root_note_name = note_names[root_note % 12]
    return "#{root_note_name}-major" if is_major
  
    "#{root_note_name}-minor"
  end
  
  def contains(arr, target)
    arr.include?(target)
  end
  
  def main
    num_test_cases = gets.to_i
  
    (1..num_test_cases).each do
      input_notes = gets.chomp.split.map(&:to_i)
      chord_name = determine_chord_name(input_notes)
      print "#{chord_name} "
    end
  end
  
  main
  