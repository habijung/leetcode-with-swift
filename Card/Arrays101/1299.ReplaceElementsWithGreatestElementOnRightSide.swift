//
//  1299.ReplaceElementsWithGreatestElementOnRightSide.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 7/29/25.
//

import Foundation
import Testing

class Solution1299 {
    func replaceElements(_ arr: [Int]) -> [Int] {
        guard arr.count > 1 else {
            return [-1]
        }

        var max: Int = -1
        var result = arr

        for i in stride(from: arr.count - 1, through: 0, by: -1) {
            let arrNum = result[i]

            result[i] = max

            if arrNum >= max {
                max = arrNum
            }
        }

        return result
    }
}

struct Test1299 {
    let solution = Solution1299()
    static let testCases: [(arr: [Int], expected: [Int])] = [
        ([17, 18, 5, 4, 6, 1], [18, 6, 6, 6, 1, -1]),
        ([400], [-1]),
    ]

    @Test("1299. Replace Elements with Greatest Element on Right Side", arguments: testCases)
    func runSolution(arr: [Int], expected: [Int]) async throws {
        #expect(solution.replaceElements(arr) == expected)
    }
}
