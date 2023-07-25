import Cocoa

func main() {
  let option = Int(readLine()!)!

  switch option {
  case 1:
    // Generate Hamming code
    print("Enter the data bits")
    let data = readLine()!
    let dataBits = data.map { Int(String($0))! }
    let r = 1
    while (dataBits.count + r + 1 > pow(2, r)) {
      r += 1
    }
    var hammingCode = [Int]()
    for i in 0 ..< r + dataBits.count {
      let p = pow(2, i)
      if p == i + 1 {
        hammingCode.append(0)
      } else {
        hammingCode.append(dataBits[i])
      }
    }
    for parity in 0 ..< hammingCode.count {
      let ph = pow(2, parity)
      if ph == parity + 1 {
        let startIndex = ph - 1
        var toXor = [Int]()
        for i in stride(from: startIndex, to: hammingCode.count, by: 2 * ph) {
          toXor.append(hammingCode[i])
        }
        hammingCode[startIndex] = hammingCode[startIndex] ^ toXor.reduce(0, +)
      }
    }
    hammingCode.reverse()
    print("Hamming code generated would be:- ", end="")
    print(Int(hammingCode.joined()))

  case 2:
    // Detect error in received Hamming code
    print("Enter the hamming code received")
    let hammingCode = readLine()!
    let dataBits = hammingCode.map { Int(String($0))! }
    var parityList = [Int]()
    for parity in 0 ..< hammingCode.count {
      let ph = pow(2, parity)
      if ph == parity + 1 {
        parityList.append(hammingCode[parity])
      }
    }
    parityList.reverse()
    var error = sum(parity * pow(2, i) for i, parity in enumerate(parityList[::-1]))

    if error == 0 {
      print("There is no error in the hamming code received")
    } else if error >= dataBits.count {
      print("Error cannot be detected")
    } else {
      print("Error is in", error, "bit")
      if dataBits[error - 1] == 0 {
        dataBits[error - 1] = 1
      } else {
        dataBits[error - 1] = 0
      }
      print("After correction hamming code is:- ")
      print(Int(dataBits.joined()))
    }

  default:
    print("Option entered does not exist")
  }
}

main()
