fn generate_brainfuck_code(n: i32) -> String {
    let mut bf_code = String::new();

    bf_code.push_str("++[->+<]");
    bf_code.push_str(">[->>>>+<<<<]");
    bf_code.push_str("[->+<]");
    bf_code.push_str(">[->>>>+<<<<]");
    bf_code.push_str(">>>>[-<+++++>]<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>+[-<+>]>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>+[-<+>]>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<[-<+>]+[-<[->>+<<]>[-<+>]+>[->>>+<<<]>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<[-<+>]++++[-<+++++++++++>]>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<<<<+[-<+>]>>>>[-]>[-<<<<+>>>>]<<<<<<[->>>>>+<<<<<[->+>>-[>+>>]>[+[-<+>]>+>>]<<<<<<]>[-]>[-<<+>>]<<[->>+<<]]>>>[-]<<[-<+>]++++[-<+++++++++++>]<.[-]<[-]<");

    bf_code
}

fn main() {
    let n = 13;
    let bf_code = generate_brainfuck_code(n);

    println!("Brainfuck++ Code:");
    println!("{}", bf_code);
}
