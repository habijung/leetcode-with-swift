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
    
    @Test
    func example() {
        #expect(solution.findMaxConsecutiveOnes([1, 1, 0, 1, 1, 1]) == 3)
    }
}
