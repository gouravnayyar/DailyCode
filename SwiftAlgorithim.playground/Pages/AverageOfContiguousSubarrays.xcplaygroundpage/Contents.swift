// Average Of Contiguous Subarrays
// Given an array, find the average of all contiguous subarrays of size ‘K’ in it.
// Input: Array: [1, 3, 2, 6, -1, 4, 1, 8, 2], K=5
// Output: [2.2, 2.8, 2.4, 3.6, 2.8]

func findAverage(_ array:[Int], size: Int) -> [Double] {

    var result: [Double] = []

    for index in 0...(array.count - size)  {
        print("\n")
        var sum = 0
        for innerIndex in index..<(index+size) {
            sum += array[innerIndex]
        }
        result.append(Double(sum)/Double(size))
    }

    return result
}

let array = [1, 3, 2, 6, -1, 4, 1, 8, 2]
print(findAverage(array, size: 5))


/// Time complexity is O(N*K)
/// Silding window approach and the complexity would reduce to O(n)


func findAverageUsingSlidingWindowApproach(_ array:[Int], size: Int) -> [Double] {
    var result: [Double] = []
    var windowSum = 0.0
    var windowStart = 0

    for windowEnd in 0..<array.count {
        windowSum += Double(array[windowEnd]) // +1+3+2+6-1 = 11 // 10+4

        if windowEnd >= size - 1 { // 0 >= 4 .. . 4>=4 ... 5>=4
            result.append(Double(windowSum)/Double(size)) // 11/5 // 14/5
            windowSum -= Double(array[windowStart]) // 11 - 1 = 10 // 14-3(11)
            windowStart += 1
        }
    }

    return result
}

let newArray = [1, 3, 2, 6, -1, 4, 1, 8, 2]
print(findAverageUsingSlidingWindowApproach(newArray, size: 5))

