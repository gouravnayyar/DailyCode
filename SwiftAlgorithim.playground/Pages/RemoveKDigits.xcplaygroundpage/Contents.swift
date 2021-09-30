
func removeKdigits(_ num: String, _ k: Int) -> String {
    var k = k
    let num = num.map { Int(String($0)) }
    var stack = [Int]()

    for i in 0..<num.count {
        if stack.isEmpty && num[i] != 0 {
            stack.append(num[i]!)
        } else {
            let val = num[i] // 4
            while (!stack.isEmpty && k > 0 && val! < stack.last!) {
                stack.removeLast()
                k -= 1
            }

            if !stack.isEmpty {
                stack.append(val!)
            } else if val == 0 {
                k -= 1
            }
        }
    }

    // case if there is no dip
    while (!stack.isEmpty && k > 0) {
        stack.removeLast()
        k -= 1
    }

    if stack.isEmpty {
        return "0"
    }

    return stack.map { String(Int($0))}.joined()
}

print(removeKdigits("1432219", 3))
