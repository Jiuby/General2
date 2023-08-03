fn lucky_tickets(n: usize, b: usize) -> usize {
    let mut lucky_tickets = 0;
    let max_value = (1 << n) - 1;
    for i in 0..max_value {
      let mut first_half = 0;
      let mut second_half = 0;
      let mut j = 0;
      while i > 0 {
        let digit = i % b;
        first_half += digit if j < n / 2 else second_half += digit;
        i >>= 1;
        j += 1;
      }
      if first_half == second_half {
        lucky_tickets += 1;
      }
    }
    return lucky_tickets;
  }
  
  fn main() {
    let n = read_line().unwrap().parse().unwrap();
    let b = read_line().unwrap().parse().unwrap();
    println!("{}", lucky_tickets(n, b));
  }