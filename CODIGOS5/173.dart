import 'dart:io';

void main() {
  int numTestCases = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < numTestCases; i++) {
    List<String> inputNotes = stdin.readLineSync()!.split(' ');
    List<int> notes = inputNotes.map(int.parse).toList();

    String chordName = determineChordName(notes);
    stdout.write('$chordName ');
  }
}

String determineChordName(List<int> notes) {
  List<int> steps = [];
  for (int i = 1; i < notes.length; i++) {
    int diff = (notes[i] - notes[i - 1] + 12) % 12;
    steps.add(diff);
  }

  if (steps.contains(3) && steps.contains(4)) {
    return 'other';
  } else if (steps.contains(4)) {
    return getChordName(notes[0], true);
  } else if (steps.contains(3)) {
    return getChordName(notes[0], false);
  } else {
    return 'other';
  }
}

String getChordName(int rootNote, bool isMajor) {
  List<String> noteNames = [
    'C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B'
  ];
  String rootNoteName = noteNames[rootNote % 12];
  return '$rootNoteName ${isMajor ? "major" : "minor"}';
}
