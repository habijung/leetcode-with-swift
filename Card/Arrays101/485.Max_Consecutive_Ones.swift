//
//  485.Max_Consecutive_Ones.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 7/16/25.
//

import Foundation
import Testing

class Solution485 {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var maxCount = 0
        var currentCount = 0

        for num in nums {
            if num == 1 {
                currentCount += 1
            } else {
                maxCount = max(currentCount, maxCount)
                currentCount = 0
            }
        }

        // 끝까지 0이 나오지 않은 경우에 비교하기
        maxCount = max(currentCount, maxCount)

        return maxCount
    }
}

struct Test485 {
    let solution = Solution485()

    static let testCases: [(input: [Int], answer: Int)] = [
        (input: [1, 1, 0, 1, 1, 1], answer: 3),
    ]

    @Test("485. Max Consecutive Ones", arguments: testCases)
    func runSolution(input: [Int], expected: Int) async throws {
        #expect(solution.findMaxConsecutiveOnes(input) == expected)
    }
}
