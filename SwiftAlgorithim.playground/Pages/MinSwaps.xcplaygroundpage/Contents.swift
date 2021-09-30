
func minSwaps(_ s: String) -> Int {
    let s = [Character](s)
    var stack = Stack()
    for i in 0..<s.count {
        if(stack.isEmpty){
            stack.push(s[i])
        } else {
            if s[i] == "]" {
                if stack.peek() == "[" {
                    stack.pop()
                } else {
                    stack.push(s[i])
                }
            } else {
                stack.push(s[i])
            }
        }
    }

    return stack.size()/2 - 1
}


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

    func size() -> Int {
        return list.count
    }
}

print(minSwaps("[]"))
