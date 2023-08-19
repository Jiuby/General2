<?php

function isWordPossible($word, $letters) {
    $letterCounts = array_count_values(str_split($letters));

    foreach (str_split($word) as $char) {
        if (!isset($letterCounts[$char]) || $letterCounts[$char] <= 0) {
            return false;
        }
        $letterCounts[$char]--;
    }

    return true;
}

$dictionary = file('dictionary.txt', FILE_IGNORE_NEW_LINES);
$inputLines = file('input.txt', FILE_IGNORE_NEW_LINES);
$testCases = (int)$inputLines[0];
$inputCases = array_slice($inputLines, 1);

foreach ($inputCases as $caseLine) {
    list($wordLength, $letters) = explode(' ', $caseLine);
    $count = 0;

    foreach ($dictionary as $word) {
        if (strlen($word) == (int)$wordLength && isWordPossible($word, $letters)) {
            $count++;
        }
    }

    echo $count . ' ';
}

?>
