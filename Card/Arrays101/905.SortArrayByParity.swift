//
//  905.SortArrayByParity.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 8/3/25.
//

import Foundation
import Testing

class Solution905 {
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        guard !nums.isEmpty else {
            return []
        }
        
        var result = nums
        var writeIndex = 0
        
        for (i, num) in nums.enumerated() {
            guard num % 2 == 0 else {
                continue
            }
            
            if result[writeIndex] % 2 == 1 {
                result[i] = result[writeIndex]
                result[writeIndex] = num
            }
            
            writeIndex += 1
        }
        
        return result
    }
}

struct Test905 {
    let solution = Solution905()
    static let testCases: [(nums: [Int], expected: [[Int]])] = [
        (
            nums: [3, 1, 2, 4],
            expected: [
                [2, 4, 1, 3],
                [2, 4, 3, 1],
                [4, 2, 1, 3],
                [4, 2, 3, 1],
            ]
        ),
        (
            nums: [0],
            expected: [
                [0],
            ]
        ),
    ]
    
    @Test("905. Sort Array By Parity", arguments: testCases)
    func runSolution(nums: [Int], expected: [[Int]]) async throws {
        let result = solution.sortArrayByParity(nums)
        #expect(expected.contains(result))
    }
}
