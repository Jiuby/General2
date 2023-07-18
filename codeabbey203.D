import std.stdio;

void main() {
  int n;
  scanf("%d", &n);

  int m[n][n];
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      scanf("%d", &m[i][j]);
    }
  }

  int count = 0;
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      if (m[i][j] == 1) {
        count++;
      }
    }
  }

  printf("%d\n", count);
}
