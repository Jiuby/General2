use std::io::Read;

fn main() {
  let mut input = String::new();
  std::io::stdin().read_to_string(&mut input).unwrap();

  let mut eggs = input.split_whitespace().map(|n| n.parse().unwrap()).collect::<Vec<_>>();
  let mut touching = vec![vec![0; 20]; 20];

  for _ in 0..20 {
    let mut line = input.split_whitespace();
    let egg_index = line.next().unwrap().parse().unwrap();
    let mut neighbors: Vec<_> = line.map(|n| n.parse().unwrap()).collect();
    neighbors.push(egg_index);
    touching[egg_index].extend_from_slice(&neighbors);
  }

  let mut ans = Vec::new();
  for i in 0..20 {
    let mut changed = false;
    for j in 0..20 {
      if eggs[j] == 1 && touching[i][j] == 1 {
        eggs[j] = 0;
        changed = true;
      }
    }
    if !changed {
      ans.push(i);
    }
  }

  for i in 0..ans.len() {
    println!("{}", ans[i]);
  }
}
