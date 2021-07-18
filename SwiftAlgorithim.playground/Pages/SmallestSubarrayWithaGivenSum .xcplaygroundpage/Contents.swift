// Given an array of positive numbers and a positive number ‘S’, find the length of the smallest contiguous subarray whose sum is greater than or equal to ‘S’. Return 0, if no such subarray exists.
/*
Example 1:

Input: [2, 1, 5, 2, 3, 2], S=7
Output: 2
Explanation: The smallest subarray with a sum great than or equal to '7' is [5, 2].


 Example 2:

Input: [2, 1, 5, 2, 8], S=7
Output: 1
Explanation: The smallest subarray with a sum greater than or equal to '7' is [8].


 Example 3:

Input: [3, 4, 1, 1, 6], S=8
Output: 3
Explanation: Smallest subarrays with a sum greater than or equal to '8' are [3, 4, 1] or [1, 1, 6].

*/


// Let start with the brute force approach
func findSmallestSubArrayWithSumGreaterThanOrEqual(to value: Int, array:[Int]) -> Int {
    var smallestSubArray = -1
    var totalSum = 0
    for index in 0..<array.count {
        totalSum = array[index]
        // when array value at index is greater than the value passed as reference
        if totalSum >= value {
            smallestSubArray = 1
            break
        }

        for innerIndex in index+1..<array.count {
            totalSum += array[innerIndex]
            let subArray = innerIndex - index + 1
            if totalSum >= value {
                if smallestSubArray == -1 {
                    smallestSubArray = subArray
                } else if smallestSubArray > subArray {
                    smallestSubArray = subArray
                }
            }

        }
    }

    return smallestSubArray
}

print("Output 1")
print(findSmallestSubArrayWithSumGreaterThanOrEqual(to: 7, array: [2, 1, 5, 2, 3, 2]))
print("\n Output 2")
print(findSmallestSubArrayWithSumGreaterThanOrEqual(to: 7, array: [2, 1, 5, 2, 8]))
print("\n Output 3")
print(findSmallestSubArrayWithSumGreaterThanOrEqual(to: 8, array: [3, 4, 1, 1, 6]))


// Now try to solve the same with the sliding window approach


func findSmallestSubArrayWithSumGreaterThanOrEqualSWA(to value: Int, array:[Int]) -> Int {

    var windowSum = 0
    var minLength = Int.max // 9223372036854775807
    var windowStart = 0

    for windowEnd in 0..<array.count {
        windowSum += array[windowEnd] // 8 // 8 // 5 // 7
        while windowSum >= value { // (8>=7) WS = 0 and WE = 2 // (8>=7) WS = 1 WE = 3 // (7>=7) WS=2 WE=3 (7>=7) WS = 3 WE = 5
            minLength = min(minLength, windowEnd - windowStart + 1) // 3 // 3 // 2 // 3
            windowSum -= array[windowStart] // 6 // 7 // 2 // 3
            windowStart += 1 // 1 // 2 // 3 //4
        }
    }

    return minLength
}
print("Sliding window approach")
print(findSmallestSubArrayWithSumGreaterThanOrEqualSWA(to: 7, array: [2, 1, 5, 2, 3, 2]))
print(findSmallestSubArrayWithSumGreaterThanOrEqualSWA(to: 7, array: [2, 1, 5, 2, 8]))
print(findSmallestSubArrayWithSumGreaterThanOrEqualSWA(to: 8, array: [3, 4, 1, 1, 6]))
