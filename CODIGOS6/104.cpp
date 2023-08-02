#include <iostream>
#include <vector>

using namespace std;

int main() {
  int n, eggs[20], touching[20][20], ans[20];
  cin >> n;
  for (int i = 0; i < n; i++) {
    cin >> eggs[i];
  }
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      touching[i][j] = 0;
    }
  }
  for (int i = 0; i < n; i++) {
    int k;
    cin >> k;
    for (int j = 0; j < k; j++) {
      int t;
      cin >> t;
      touching[i][t] = 1;
    }
  }
  int cnt = 0;
  for (int i = 0; i < n; i++) {
    int flag = 1;
    for (int j = 0; j < n; j++) {
      if (eggs[j] == 1 && touching[i][j] == 1) {
        flag = 0;
        break;
      }
    }
    if (flag) {
      ans[cnt++] = i;
    }
  }
  for (int i = 0; i < cnt; i++) {
    cout << ans[i] << " ";
  }
  cout << endl;
  return 0;
}
