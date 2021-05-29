
//  Given an array of positive numbers and a positive number ‘k’, find the maximum sum of any contiguous subarray of size ‘k’.

/*
        Input: [2, 1, 5, 1, 3, 2], k=3
        Output: 9
        Explanation: Subarray with maximum sum is [5, 1, 3].

        Input: [2, 3, 4, 1, 5], k=2
        Output: 7
        Explanation: Subarray with maximum sum is [3, 4].

 */


// Frist approach brut force
func findMaximumSum(_ array: [Int], size: Int) -> Int {

    var maxSum = 0 // observe the maximum sum
    for index in 0...(array.count - size) { // from 0 to (5 - 3)
        var innerSum = 0
        for innerIndex in index..<index+size { // from 0 to 2, 1 to 3, 2 to 4
            innerSum += array[innerIndex]
        }

        if maxSum < innerSum {
            maxSum = innerSum
        }
    }

    return maxSum
}

print("Brut force: ")
print(findMaximumSum([2, 1, 5, 1, 3, 2], size: 3))
print(findMaximumSum([2, 3, 4, 1, 5], size: 2))
print("\n\n")
// The time complexity of the above algorithm will be O(N*K)

// ------------------------------------------------------------------------------


func findMaximumSumSlidingWindow(_ array: [Int], size: Int) -> Int {
    var maxSum = 0 // observe the maximum sum
    var windowSum = 0
    var windowStart = 0
    for index in 0..<array.count { // from 0 to 5
        windowSum += array[index]

        if index >= size - 1 {
            if maxSum < windowSum {
                maxSum = windowSum
            }
            windowSum -= array[windowStart]
            windowStart += 1
        }

    }

    return maxSum
}

print("\n Sliding window approach Result: ")
print(findMaximumSumSlidingWindow([2, 1, 5, 1, 3, 2], size: 3))
print(findMaximumSumSlidingWindow([2, 3, 4, 1, 5], size: 2))

// The time complexity of the above algorithm will be O(N)


