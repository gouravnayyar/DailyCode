/*
 You are climbing a staircase. It takes n steps to reach the top.

 Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?



 Example 1:

 Input: n = 2
 Output: 2
 Explanation: There are two ways to climb to the top.
 1. 1 step + 1 step
 2. 2 steps
 Example 2:

 Input: n = 3
 Output: 3
 Explanation: There are three ways to climb to the top.
 1. 1 step + 1 step + 1 step
 2. 1 step + 2 steps
 3. 2 steps + 1 step

 */
func climbStairs(_ n: Int) -> Int {
    if n == 1 {
        return 1
    }

    var n1 = 1
    var n2 = 2

    for i in 3 ..< n + 1 {
        print(i)
        let previousN1 = n1 // 1 // 2
        n1 = n2 // 2 // 3
        n2 = n2 + previousN1 // 3 // 5
    }

    return n2
}

print(climbStairs(4))
