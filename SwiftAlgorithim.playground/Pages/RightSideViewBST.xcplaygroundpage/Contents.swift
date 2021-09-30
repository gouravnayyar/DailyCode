// leet code #199
/*
Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.

 Input: root = [1,2,3,null,5,null,4]
 Output: [1,3,4]
*/

class Node {
    var data: Int
    var left: Node?
    var right: Node?

    init(_ data: Int, left: Node? = nil, right: Node? = nil) {
        self.data = data
        self.right = right
        self.left = left
    }
}


func rightSideView(_ root: Node?) -> [Int] {
    // if my root is available
    guard let root = root else { return [] }
    var result: [Int] = []
    var queue:[Node] = [root]
    while !queue.isEmpty {
        var rightMostNodeData = -1
        for _ in 0..<queue.count { // o(n)
            let node = queue.removeFirst() //O(n)
            rightMostNodeData = node.data

            if node.left != nil {
                queue.append(node.left!) //O(1)
            }
            if node.right != nil {
                queue.append(node.right!) //O(1)
            }
        }
        result.append(rightMostNodeData)
    }

    return result
}

let root1 = Node(1,left:Node(2, right: Node(5)) ,
                 right:Node(3))

print(rightSideView(root1))
