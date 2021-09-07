import Foundation

/*
     Given two strings s and t of length N, find the maximum number of possible matching pairs in strings s and t after swapping exactly two characters within s.
     A swap is switching s[i] and s[j], where s[i] and s[j] denotes the character that is present at the ith and jth index of s, respectively. The matching pairs of the two strings are defined as the number of indices for which s[i] and t[i] are equal.
     Note: This means you must swap two characters at different indices.


 Example 1
     s = "abcd"
     t = "adcb"
     output = 4

 Example 2
     s = "mno"
     t = "mno"
     output = 1
 */
/*
1. if strings are equal then return length - 2
2.
*/
func matchingPairs(s: String, t: String) -> Int {
    if s == t { return s.count - 2 }
    let s = [Character](s)
    let t = [Character](t)
    var unmachedPairs = Set<Character>()
    var unmachedInS = Set<Character>()
    var unmachedInT = Set<Character>()

    var count = 0
    var foundPerfectSwap = false
    var maxMatchingPair = 0

    for index in 0..<s.count {
        if s[index] == t[index] {
            count += 1
        }

        if s[index] != t[index] {
            if foundPerfectSwap {
                foundPerfectSwap = false
                count = 0
            }

            unmachedPairs.insert(s[index])
            unmachedPairs.insert(t[index])
            unmachedInT.insert(t[index])
            unmachedInS.insert(s[index])
        }

        if unmachedInT.contains(s[index]), unmachedInS.contains(t[index]) {
            foundPerfectSwap = true
            if maxMatchingPair < count + 2 {
                maxMatchingPair = count + 2
            }
        } else if unmachedPairs.contains(t[index]), unmachedPairs.contains(s[index]) {
            // Found partial match
            maxMatchingPair = count
        }
    }

    return maxMatchingPair
}

let s1 = "adcnxyzdp"
let t1 = "abcdxyznp"
let expected1 = 7
let output1 = matchingPairs(s: s1, t: t1)
print("expected = [\(expected1)] and outpot = [\(output1)]")





