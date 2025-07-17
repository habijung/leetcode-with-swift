//
//  977.SquaresOfASortedArray.swift
//  LeetcodeWithSwift
//
//  Created by hbjung on 7/17/25.
//

import Foundation
import Testing


class Solution977 {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: nums.count)
        
        var left = 0
        var right = nums.count - 1
        var index = nums.count - 1
        
        // nums가 이미 정렬되어 있으므로 Two Pointers 방식으로 result array의 뒤부터 결과를 대입
        // Time Complexity: O(n)
        while left <= right {
            if abs(nums[left]) > abs(nums[right]) {
                result[index] = nums[left] * nums[left]
                left += 1
            } else {
                result[index] = nums[right] * nums[right]
                right -= 1
            }
            
            // 그 다음으로 작거나 같은 값을 채우기
            index -= 1
        }
        
        return result
    }
}


struct Test977 {
    let solution = Solution977()
    
    static let testCases: [(input: [Int], expected: [Int])] = [
        ([-7, -3, 2, 3, 11], [4, 9, 9, 49, 121]),
    ]
    
    @Test("977. Squares of a Sorted Array", arguments: testCases)
    func runSolution(input: [Int], expected: [Int]) async throws {
        #expect(solution.sortedSquares(input) == expected)
    }
}
