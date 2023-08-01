using System;
using System.Collections.Generic;

class Program
{
    static void Main()
    {
        int numTestCases = int.Parse(Console.ReadLine());

        for (int i = 0; i < numTestCases; i++)
        {
            string[] inputNotes = Console.ReadLine().Split();
            int[] notes = Array.ConvertAll(inputNotes, int.Parse);

            string chordName = DetermineChordName(notes);
            Console.Write(chordName + " ");
        }
    }

    static string DetermineChordName(int[] notes)
    {
        List<int> steps = new List<int>();
        for (int i = 1; i < notes.Length; i++)
        {
            int diff = (notes[i] - notes[i - 1] + 12) % 12;
            steps.Add(diff);
        }

        if (steps.Contains(3) && steps.Contains(4))
        {
            return "other";
        }
        else if (steps.Contains(4))
        {
            return GetChordName(notes[0], true);
        }
        else if (steps.Contains(3))
        {
            return GetChordName(notes[0], false);
        }
        else
        {
            return "other";
        }
    }

    static string GetChordName(int rootNote, bool isMajor)
    {
        string[] noteNames = { "C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B" };
        string rootNoteName = noteNames[rootNote % 12];
        return rootNoteName + (isMajor ? "-major" : "-minor");
    }
}
