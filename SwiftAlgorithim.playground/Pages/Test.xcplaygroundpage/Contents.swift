


func test() {

    let s = "abcdbb"
    let chars = [Character](s)
    var startIndex = 4
    let current = chars[startIndex] //a
    var set = Set<Character>()
    set.insert("a")
    set.insert("b")
    set.insert("c")
    set.insert("d")

    while chars[startIndex] != current {
       print(" removing = \(chars[startIndex])")
       set.remove(chars[startIndex])
       startIndex += 1
       print("While loop startIndex = \(startIndex)")
    }
}

print(test())
