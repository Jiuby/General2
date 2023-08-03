import 'dart:io';

void main() {
  int n = int.parse(stdin.readLineSync());
  int b = int.parse(stdin.readLineSync());

  int luckyTickets = 0;
  for (int i = 0; i < (1 << n) - 1; i++) {
    int firstHalf = 0;
    int secondHalf = 0;
    int j = 0;
    while (i > 0) {
      int digit = i % b;
      firstHalf += digit if j < n / 2 else secondHalf += digit;
      i >>= 1;
      j += 1;
    }
    if (firstHalf == secondHalf) {
      luckyTickets++;
    }
  }

  print(luckyTickets);
}
