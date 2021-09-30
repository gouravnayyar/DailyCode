

func minRemoveToMakeValid(_ s: String) -> String {
    var s = s.map({String($0)}), stack = [Int]()
    for i in 0..<s.count {
        if s[i] == "(" {
            stack.append(i)
        } else if s[i] == ")" && stack.popLast() == nil {
            s[i] = ""
        }
    }
    for i in stack {
        s[i] = ""
    }
    return s.joined()
}

print(minRemoveToMakeValid("lee(t(c)o)de)"))
