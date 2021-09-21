/*
 You are given a string s consisting of lowercase English letters. A duplicate removal consists of choosing two adjacent and equal letters and removing them.

 We repeatedly make duplicate removals on s until we no longer can.

 Return the final string after all such duplicate removals have been made. It can be proven that the answer is unique.


 Example 1:

 Input: s = "abbaca"
 Output: "ca"
 Explanation:
 For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".

 */

func removeDuplicates(_ s: String) -> String {
    // create a stack
    var stack = Stack()

    // iterate through all the elements
    for char in s {
        // this condition makes sure at least one value is there in the stack
        if stack.isEmpty {
            stack.push(char)
        } else {
            let last = stack.peek()
            if char == last {
                stack.pop()
            } else {
                stack.push(char)
            }
        }

    }

    return String(stack.list)
}

// Create a stack
struct Stack {
    var list = [Character]()

    var isEmpty: Bool {
        return list.isEmpty
    }

    mutating func push(_ val: Character) {
        list.append(val)
    }

    @discardableResult
    mutating func pop() -> Character? {
        return list.removeLast()
    }

    func peek() -> Character? {
        return list.last
    }
}

print(" Output = \(removeDuplicates("azxxzy")) \n Expected = ay")
