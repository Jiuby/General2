function main(args: string[]) {
    let option = parseInt(readline(), 10);
  
    switch (option) {
      case 1:
        // Generate Hamming code
        console.log("Enter the data bits");
        let data = readline();
        let dataBits = data.split(' ').map((bit) => parseInt(bit, 10));
        let r = 1;
        while (dataBits.length + r + 1 > Math.pow(2, r)) {
          r++;
        }
        let hammingCode = [];
        for (let i = 0; i < r + dataBits.length; i++) {
          let p = Math.pow(2, i);
          if (p == i + 1) {
            hammingCode.push(0);
          } else {
            hammingCode.push(dataBits[i]);
          }
        }
        for (let parity = 0; parity < hammingCode.length; parity++) {
          let ph = Math.pow(2, parity);
          if (ph == parity + 1) {
            let startIndex = ph - 1;
            let toXor = [];
            for (let i = startIndex; i < hammingCode.length; i += 2 * ph) {
              toXor.push(hammingCode[i]);
            }
            hammingCode[startIndex] = hammingCode[startIndex] ^ toXor.reduce((a, b) => a ^ b);
          }
        }
        hammingCode.reverse();
        console.log("Hamming code generated would be:- ", hammingCode.join(' '));
  
        break;
      case 2:
        // Detect error in received Hamming code
        console.log("Enter the hamming code received");
        let hammingCode = readline();
        let dataBits = hammingCode.split(' ').map((bit) => parseInt(bit, 10));
        let parityList = [];
        for (let parity = 0; parity < hammingCode.length; parity++) {
          let ph = Math.pow(2, parity);
          if (ph == parity + 1) {
            parityList.push(hammingCode[parity]);
          }
        }
        parityList.reverse();
        let error = parityList.reduce((a, b) => a ^ b, 0);
  
        if (error == 0) {
          console.log("There is no error in the hamming code received");
       
  