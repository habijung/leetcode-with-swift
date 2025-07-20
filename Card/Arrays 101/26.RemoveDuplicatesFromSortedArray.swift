//
//  26.RemoveDuplicatesFromSortedArray.swift
//  LeetcodeWithSwift
//
//  Created by habi on 7/20/25.
//

import Foundation
import Testing

class Solution26 {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else {
            return 0
        }
        
        let INT_MIN = -999 // For empty value
        
        var val = INT_MIN
        var writeIndex = 0
        var isSaved = false
        
        for (index, num) in nums.enumerated() {
            // num 값 사용하고 현재 값 비우기
            nums[index] = INT_MIN
            
            if val < num {
                val = num
                isSaved = false
            }
            
            guard !isSaved else {
                continue
            }
            
            nums[writeIndex] = num
            writeIndex += 1
            isSaved = true
        }
        
        return writeIndex
    }
}

struct Test26 {
    let solution = Solution26()
    static let testCases: [(nums: [Int], expected: Int)] = [
        ([1, 1, 2], 2),
        ([0, 0, 1, 1, 1, 2, 2, 3, 3, 4], 5),
        ([], 0),
    ]

    @Test("26. Remove Duplicates from Sorted Array", arguments: testCases)
    func runSolution(nums: [Int], expected: Int) async throws {
        var nums = nums
        #expect(solution.removeDuplicates(&nums) == expected)
    }
}
