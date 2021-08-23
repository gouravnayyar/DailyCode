import Foundation

struct RotationalCipher {
    let backing:String
    let alphabet = ["a","b","c","d","e","f",
                    "g","h","i","j","k","l","m",
                    "n","o","p","q","r","s","t",
                    "u","v","w","x","y","z"]
    func cipher(withRotationFactor: Int) ->  String {
        let upperAlphabetIndex = 26
        var newString = String()

        for element in backing {
            print(":")
            if element.isLetter {
                let elemetWasUppercase = element.isUppercase
                let letter = String(element.lowercased())
                if let startingIndex = alphabet.firstIndex(of: letter) {
                    let rotatedIndex = (startingIndex + withRotationFactor) % upperAlphabetIndex
                    let rotatedLetter = alphabet[rotatedIndex]
                    newString += elemetWasUppercase ? rotatedLetter.uppercased() : rotatedLetter
                }
            } else if element.isNumber {
                let number = (element.wholeNumberValue ?? 0) + withRotationFactor
                newString += String(number%10)
            } else {
                newString += String(element)
            }
        }

        return newString
    }
}

private var testCaseNumber = 1;

private extension String {
  var characterArray: String {
    return "[\"\(self)\"]"
  }
}

private extension RotationalCipher {
    static func check(_ expectedValue: String, against output: String) {
      let rightTick = "\u{2713}";
      let wrongTick = "\u{2717}";

      let result = expectedValue == output
      if result {
        print("\(rightTick) Test #\(testCaseNumber)")
      } else {
        print("\(wrongTick) Test #\(testCaseNumber) Expected: \(expectedValue.characterArray) Your output: \(output.characterArray)")
      }
      testCaseNumber += 1
    }
}

let input1 = "All-convoYs-9-be:Alert1."
let expected1 = "Epp-gsrzsCw-3-fi:Epivx5."
let output1 = RotationalCipher(backing: input1).cipher(withRotationFactor: 4)
RotationalCipher.check(expected1, against: output1)
