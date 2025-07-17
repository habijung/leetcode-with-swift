//
//  1295.FindNumbersWithEvenNumberOfDigits.swift
//  RunCode
//
//  Created by hbjung on 7/17/25.
//

import Foundation
import Testing


class Solution1295 {
    func findNumbers(_ nums: [Int]) -> Int {
        var count: Int = 0
        
        for num in nums {
            if String(num).count.isMultiple(of: 2) {
                count += 1
            }
        }
        
        return count
    }
}


struct Test1295 {
    let solution = Solution1295()
    
    static let testCases: [(input: [Int], expected: Int)] = [
        ([12, 345, 2, 6, 7896], 2),
        ([555, 901, 482, 1771], 1),
    ]
    
    @Test("Find Numbers with Even Number of Digits", arguments: testCases)
    func runSolution(input: [Int], expected: Int) async throws {
        #expect(solution.findNumbers(input) == expected)
    }
}
