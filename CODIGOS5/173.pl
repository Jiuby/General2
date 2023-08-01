sub determineChordName {
    my @notes = @_;
    my @steps;
    for (my $i = 1; $i < scalar(@notes); $i++) {
        my $diff = ($notes[$i] - $notes[$i - 1] + 12) % 12;
        push @steps, $diff;
    }

    if (contains(\@steps, 3) && contains(\@steps, 4)) {
        return "other";
    } elsif (contains(\@steps, 4)) {
        return getChordName($notes[0], 1);
    } elsif (contains(\@steps, 3)) {
        return getChordName($notes[0], 0);
    } else {
        return "other";
    }
}

sub getChordName {
    my ($rootNote, $isMajor) = @_;
    my @noteNames = qw(C C# D D# E F F# G G# A A# B);
    my $rootNoteName = $noteNames[$rootNote % 12];
    if ($isMajor) {
        return "$rootNoteName-major";
    }
    return "$rootNoteName-minor";
}

sub contains {
    my ($arrRef, $target) = @_;
    foreach my $num (@$arrRef) {
        return 1 if $num == $target;
    }
    return 0;
}

sub main {
    my $numTestCases = <>;
    chomp($numTestCases);

    for (my $i = 0; $i < $numTestCases; $i++) {
        my $inputNotes = <>;
        chomp($inputNotes);
        my @notes = split(' ', $inputNotes);

        my $chordName = determineChordName(@notes);
        print "$chordName ";
    }
}

main();
