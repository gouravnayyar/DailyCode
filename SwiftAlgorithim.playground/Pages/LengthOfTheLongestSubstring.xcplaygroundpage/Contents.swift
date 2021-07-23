

func lengthOfLongestSubstring(_ s: String) -> Int {

     guard s.count != 0 else {
         return 0
     }

     var set = Set<Character>()

    let chars = [Character](s)

     var maxlen = 0
     var startIndex = 0

    print(chars.count)
     for i in 0..<chars.count {
         let current = chars[i] //a

         if set.contains(current) {
            maxlen = max(maxlen, i - startIndex)
            print("For loop: \(i) startIndex = \(startIndex)")
             while chars[startIndex] != current { // bz - b = b
                print(" removing = \(chars[startIndex])")
                set.remove(chars[startIndex])
                startIndex += 1
                print("While loop startIndex = \(startIndex)")
             }

             startIndex += 1
            print("startIndex end = \(startIndex)")

         } else {
            set.insert(current)
         }

     }

     maxlen = max(maxlen, chars.count - startIndex)

     return maxlen
 }

print(lengthOfLongestSubstring("abzbb"))
