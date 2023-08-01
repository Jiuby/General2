use std::io;

fn determine_chord_name(notes: &[i32]) -> String {
    let mut steps = Vec::new();
    for i in 1..notes.len() {
        let diff = (notes[i] - notes[i - 1] + 12) % 12;
        steps.push(diff);
    }

    if steps.contains(&3) && steps.contains(&4) {
        return "other".to_string();
    } else if steps.contains(&4) {
        return get_chord_name(notes[0], true);
    } else if steps.contains(&3) {
        return get_chord_name(notes[0], false);
    } else {
        return "other".to_string();
    }
}

fn get_chord_name(root_note: i32, is_major: bool) -> String {
    let note_names = vec![
        "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B",
    ];
    let root_note_name = note_names[(root_note % 12) as usize];
    if is_major {
        return format!("{}-major", root_note_name);
    }
    format!("{}-minor", root_note_name)
}

fn main() {
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let num_test_cases: i32 = input.trim().parse().unwrap();

    for _ in 0..num_test_cases {
        input.clear();
        io::stdin().read_line(&mut input).unwrap();
        let notes: Vec<i32> = input
            .split_whitespace()
            .map(|x| x.parse().unwrap())
            .collect();

        let chord_name = determine_chord_name(&notes);
        print!("{} ", chord_name);
    }
}
