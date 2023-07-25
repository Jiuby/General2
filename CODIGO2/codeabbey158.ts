function main() {
    const option = Number(readline());
  
    switch (option) {
      case 1:
        // Generate Hamming code
        console.log("Enter the data bits");
        const data = readline();
        const dataBits = data.split(" ").map((bit) => Number(bit));
        const r = 1;
        while (dataBits.length + r + 1 > Math.pow(2, r)) {
          r++;
        }
        const hammingCode = [];
        for (let i = 0; i < r + dataBits.length; i++) {
          const p = Math.pow(2, i);
          if (p == i + 1) {
            hammingCode.push(0);
          } else {
            hammingCode.push(dataBits[i]);
          }
        }
        for (let parity = 0; parity < hammingCode.length; parity++) {
          const ph = Math.pow(2, parity);
          if (ph == parity + 1) {
            const startIndex = ph - 1;
            const toXor = [];
            for (let i = startIndex; i < hammingCode.length; i += 2 * ph) {
              toXor.push(hammingCode[i]);
            }
            hammingCode[startIndex] = hammingCode[startIndex] ^ toXor.reduce((a, b) => a ^ b);
          }
        }
        hammingCode.reverse();
        console.log("Hamming code generated would be:- ", hammingCode.join(" "));
  
        break;
      case 2:
        // Detect error in received Hamming code
        console.log("Enter the hamming code received");
        const hammingCode = readline();
        const dataBits = hammingCode.split(" ").map((bit) => Number(bit));
        const parityList = [];
        for (let parity = 0; parity < hammingCode.length; parity++) {
          const ph = Math.pow(2, parity);
          if (ph == parity + 1) {
            parityList.push(hammingCode[parity]);
          }
        }
        parityList.reverse();
        const error = parityList.reduce((a, b) => a ^ b, 0);
  
        if (error == 0) {
          console.log("There is no error in the hamming code received");
        } else {
          console.log("Error is in " + error + " bit");
        }
  
        break;
      default:
        console.log("Option entered does not exist");
    }
  }
  