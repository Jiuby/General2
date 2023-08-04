fn main() {
    let mut stdin = std::io::stdin();
    let n: usize = stdin.read_line().unwrap().parse().unwrap();
    let mut heights = Vec::new();
    for _ in 0..n {
        let line = stdin.read_line().unwrap();
        let parts = line.split_whitespace().collect::<Vec<_>>();
        let d1 = parts[0].parse().unwrap();
        let a = parts[1].parse().unwrap();
        let b = parts[2].parse().unwrap();
        let h = tan(b) * d1 / (tan(a) - tan(b));
        heights.push(h.round() as i32);
    }
    for h in heights {
        println!("{}", h);
    }
}
