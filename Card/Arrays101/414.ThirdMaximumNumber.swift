//
//  414.ThirdMaximumNumber.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 8/17/25.
//

import Foundation
import Testing

class Solution414 {
    func thirdMax(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }

        guard nums.count != 1 else {
            return nums[0]
        }

        var first: Int? = nil
        var second: Int? = nil
        var third: Int? = nil

        for num in nums {
            guard num != first && num != second && num != third else {
                continue
            }

            if first == nil || num > first! {
                third = second
                second = first
                first = num
            } else if second == nil || num > second! {
                third = second
                second = num
            } else if third == nil || num > third! {
                third = num
            }
        }

        return third ?? first!
    }
}

struct Test414 {
    let solution = Solution414()
    static let testCases: [(input: [Int], exptected: Int)] = [
        ([3, 2, 1], 1),
        ([1, 2], 2),
        ([2, 2, 3, 1], 1),
        ([1, 2, -1], -1),
    ]

    @Test("414. Third Maximum Number", arguments: testCases)
    func runSolution(input: [Int], expected: Int) async throws {
        #expect(solution.thirdMax(input) == expected)
    }
}
