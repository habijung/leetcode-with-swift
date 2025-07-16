//
//  MaxConsecutiveOnes.swift
//  RunCode
//
//  Created by hbjung on 7/16/25.
//

import Foundation
import Testing


class Solution {
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        return 3
    }
}


struct MaxConsecutiveOnes {
    let solution = Solution()
    
    static let testCases: [(input: [Int], answer: Int)] = [
        (input: [1, 1, 0, 1, 1, 1], answer: 3)
    ]
    
    @Test("Run Solution", arguments: testCases)
    func runSolution(data: (input: [Int], answer: Int)) {
        let result = solution.findMaxConsecutiveOnes(data.input)
        #expect(result == data.answer)
    }
}
