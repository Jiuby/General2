function luckyTickets(n: number, b: number): number {
    let luckyTickets = 0;
    for (let i = 0; i < (1 << n) - 1; i++) {
      let firstHalf = 0;
      let secondHalf = 0;
      let j = 0;
      while (i > 0) {
        const digit = i % b;
        firstHalf += digit if j < n / 2 else secondHalf += digit;
        i >>= 1;
        j += 1;
      }
      if (firstHalf == secondHalf) {
        luckyTickets++;
      }
    }
    return luckyTickets;
  }
  
  function main() {
    const n = +prompt("Enter the number of digits: ");
    const b = +prompt("Enter the base: ");
    console.log("The number of lucky tickets is:", luckyTickets(n, b));
  }
  
  main();
  