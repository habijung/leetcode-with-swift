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


struct MaxConsecutiveOnes {
    let solution = Solution()
    
    static let testCases: [(input: [Int], answer: Int)] = [
        (input: [1, 1, 0, 1, 1, 1], answer: 3)
    ]
    
    @Test("Run Solution", arguments: testCases)
    func runSolution(data: (input: [Int], answer: Int)) async throws {
        let result = solution.findMaxConsecutiveOnes(data.input)
        #expect(result == data.answer)
    }
}
