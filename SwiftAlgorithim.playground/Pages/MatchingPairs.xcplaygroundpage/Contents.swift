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
    var unmachedInS = Set<Character>()
    var unmachedInT = Set<Character>()

    var count = 0
    var foundPerfectSwap = false

    for index in 0..<s.count {
        if s[index] == t[index] {
            count += 1
        }

        if foundPerfectSwap {
            continue
        }

        if s[index] != t[index] {
            unmachedInT.insert(t[index])
            unmachedInS.insert(s[index])
        }

        if unmachedInT.contains(s[index]), unmachedInS.contains(t[index]) {
            foundPerfectSwap = true
        }
    }

    if foundPerfectSwap {
        return count + 2
    }

    return count - 1
}


let s1 = "adcnxyzdp"
let t1 = "abcdxyznp"
let expected1 = 8
let output1 = matchingPairs(s: s1, t: t1)
print("expected 0 = [\(expected1)] and output = [\(output1)]")

let s2 = "axb"
let t2 = "ayb"
let expected2 = 1
let output2 = matchingPairs(s: s2, t: t2)
print("expected 1 = [\(expected2)] and output = [\(output2)]")

let s3 = "xabcydpkgfqwe"
let t3 = "xcbanepkgfqwd"
let expected3 = 10
let output3 = matchingPairs(s: s3, t: t3)
print("expected 3 = [\(expected3)] and output = [\(output3)]")




