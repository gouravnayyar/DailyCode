/*
  Given the root node of a binary search tree and two integers low and high, return the sum of values of all nodes with a value in the inclusive range [low, high].

    Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
    Output: 32
    Explanation: Nodes 7, 10, and 15 are in the range [7, 15]. 7 + 10 + 15 = 32.
*/


class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ value: Int,_ left: TreeNode?,_ right: TreeNode?) {
        self.value = value
        self.right = right
        self.left = left
    }
}

// Create a tree
let nine = TreeNode(9, nil, nil)

let three = TreeNode(3, nine, nil)
let seven = TreeNode(7, nil, nil)
let eighteen = TreeNode(18, nil, nil)
let five = TreeNode(5, three, seven)
let fifteen = TreeNode(15, nil, eighteen)
let root = TreeNode(10, five, fifteen)

/*
                10

        5               15

    3       7                   18

 9

 */
var sum = 0
func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
    guard let root = root else { return sum }
    if root.value >= low, root.value <= high {
        sum += root.value
    }

    if root.left != nil {
        rangeSumBST(root.left, low, high)
    }
    if root.right != nil {
        rangeSumBST(root.right, low, high)
    }

    return sum
}

print(rangeSumBST(root, 7, 15))



