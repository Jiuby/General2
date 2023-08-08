<?php

function generateBrainfuckCode($N) {
    $bfCode = '';

    $bfCode .= '++[->+<]';
    $bfCode .= '>[->>>>+<<<<]';
    $bfCode .= '[->+<]';
    $bfCode .= '>[->>>>+<<<<]';
    $bfCode .= '>>>>[-<+++++>]<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>+[-<+>]>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>+[-<+>]>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<[-<+>]+[-<[->>+<<]>[-<+>]+>[->>>+<<<]>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<[-<+>]++++[-<+++++++++++>]>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<<<<+[-<+>]>>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<[-<+>]++++[-<+++++++++++>]<.[-]<[-]<';

    return $bfCode;
}

$N = 13;
$bfCode = generateBrainfuckCode($N);

echo "Brainfuck++ Code:\n";
echo $bfCode . "\n";

?>
