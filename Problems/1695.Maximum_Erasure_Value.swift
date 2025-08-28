//
//  1695.Maximum_Erasure_Value.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 7/22/25.
//

import Foundation
import Testing

class Solution1695 {
    func maximumUniqueSubarray(_ nums: [Int]) -> Int {
        var numSet = Set<Int>()
        var readIndex = 0
        var sum = 0
        var maxSum = 0

        guard !nums.isEmpty else {
            return 0
        }

        for num in nums {
            while numSet.contains(num) {
                let readNum = nums[readIndex]
                numSet.remove(readNum)
                sum -= readNum
                readIndex += 1
            }

            numSet.insert(num)
            sum += num

            maxSum = max(maxSum, sum)
        }

        return maxSum
    }
}

struct Test1695 {
    let solution = Solution1695()
    static let testCases: [(nums: [Int], expected: Int)] = [
        ([4, 2, 4, 5, 6], 17),
        ([5, 2, 1, 2, 5, 2, 1, 2, 5], 8),
        ([1, 2, 2, 3], 5),
        ([2, 3, 3, 1], 5),
        ([187, 470, 25, 436, 538, 809, 441, 167, 477, 110, 275, 133, 666, 345, 411, 459, 490, 266, 987, 965, 429, 166, 809, 340, 467, 318, 125, 165, 809, 610, 31, 585, 970, 306, 42, 189, 169, 743, 78, 810, 70, 382, 367, 490, 787, 670, 476, 278, 775, 673, 299, 19, 893, 817, 971, 458, 409, 886, 434], 16911),
    ]

    @Test("1695. Maximum Erasure Value", arguments: testCases)
    func runSolution(nums: [Int], expected: Int) async throws {
        #expect(solution.maximumUniqueSubarray(nums) == expected)
    }
}
