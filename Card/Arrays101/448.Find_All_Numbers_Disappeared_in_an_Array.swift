//
//  448.Find_All_Numbers_Disappeared_in_an_Array.swift
//  LeetcodeWithSwift
//
//  Created by habi on 8/28/25.
//

import Foundation
import Testing

class Solution448 {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }

        var counter: [Int] = Array(repeating: 0, count: nums.count + 1)
        var result: [Int] = []

        for num in nums {
            counter[num] += 1
        }

        for i in 1 ..< counter.count {
            guard counter[i] == 0 else {
                continue
            }

            result.append(i)
        }

        return result
    }
}

struct Test448 {
    let solution = Solution448()
    static let testCases: [(input: [Int], expected: [Int])] = [
        ([4, 3, 2, 7, 8, 2, 3, 1], [5, 6]),
        ([1, 1], [2]),
    ]

    @Test("448. Find All Numbers Disappeared in an Array", arguments: testCases)
    func runSolution(input: [Int], expected: [Int]) async throws {
        #expect(solution.findDisappearedNumbers(input) == expected)
    }
}
