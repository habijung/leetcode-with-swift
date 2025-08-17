//
//  1051.HeightChecker.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 8/12/25.
//

import Foundation
import Testing

class Solution1051 {
    func heightChecker(_ heights: [Int]) -> Int {
        guard !heights.isEmpty else {
            return 0
        }

        let sortedHeights = heights.sorted()
        var count = 0

        for i in 0 ..< heights.count {
            if heights[i] != sortedHeights[i] {
                count += 1
            }
        }

        return count
    }
}

struct Test1051 {
    let solution = Solution1051()
    static let testCases: [(input: [Int], expected: Int)] = [
        ([1, 1, 4, 2, 1, 3], 3),
        ([5, 1, 2, 3, 4], 5),
        ([1, 2, 3, 4, 5], 0),
    ]

    @Test("1051. Height Checker", arguments: testCases)
    func runSolution(input: [Int], expected: Int) async throws {
        #expect(solution.heightChecker(input) == expected)
    }
}
