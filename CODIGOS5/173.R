determine_chord_name <- function(notes) {
  steps <- diff(notes)
  steps <- (steps + 12) %% 12

  if (3 %in% steps & 4 %in% steps) {
    return("other")
  } else if (4 %in% steps) {
    return(get_chord_name(notes[1], TRUE))
  } else if (3 %in% steps) {
    return(get_chord_name(notes[1], FALSE))
  } else {
    return("other")
  }
}

get_chord_name <- function(root_note, is_major) {
  note_names <- c("C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B")
  root_note_name <- note_names[root_note %% 12 + 1]
  if (is_major) {
    return(paste0(root_note_name, "-major"))
  }
  return(paste0(root_note_name, "-minor"))
}

main <- function() {
  num_test_cases <- as.integer(readline())
  
  for (i in 1:num_test_cases) {
    input_notes <- as.integer(strsplit(readline(), " ")[[1]])
    chord_name <- determine_chord_name(input_notes)
    cat(chord_name, " ")
  }
}

main()
