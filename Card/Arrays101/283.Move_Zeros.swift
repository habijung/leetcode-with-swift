//
//  283.Move_Zeros.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 8/3/25.
//

import Foundation
import Testing

class Solution283 {
    func moveZeroes(_ nums: inout [Int]) {
        var writeIndex = 0

        for (i, num) in nums.enumerated() {
            guard num != 0 else {
                continue
            }

            if nums[writeIndex] == 0 {
                nums[writeIndex] = num
                nums[i] = 0
            }

            writeIndex += 1
        }
    }
}

struct Test283 {
    let solution = Solution283()
    static let testCases: [(nums: [Int], expected: [Int])] = [
        ([0, 1, 0, 3, 12], [1, 3, 12, 0, 0]),
        ([0], [0]),
    ]

    @Test("283. Move Zeros", arguments: testCases)
    func runSolution(nums: [Int], expected: [Int]) async throws {
        var nums = nums
        solution.moveZeroes(&nums)
        #expect(nums == expected)
    }
}
