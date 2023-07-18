def main(String[] args) {
  def n = Integer.parseInt(System.console().readLine())
  def m = new int[n][n]
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      m[i][j] = Integer.parseInt(System.console().readLine())
    }
  }
  
  def count = 0
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (m[i][j] == 1) {
        count++
      }
    }
  }
  
  System.out.println(count)
}
