//
//  977.Squares_of_a_Sorted_Array.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 7/17/25.
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
    
    func sortedSquares2(_ nums: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = nums.count - 1
        var result: [Int] = Array(repeating: 0, count: nums.count)
        
        for i in stride(from: nums.count - 1, through: 0, by: -1) {
            let leftNum = Int(pow(Double(nums[leftIndex]), 2.0))
            let rightNum = Int(pow(Double(nums[rightIndex]), 2.0))
            
            if leftNum < rightNum {
                result[i] = rightNum
                rightIndex -= 1
            } else {
                result[i] = leftNum
                leftIndex += 1
            }
        }
        
        return result
    }
}

struct Test977 {
    let solution = Solution977()
    
    static let testCases: [(input: [Int], expected: [Int])] = [
        ([-4, -1, 0, 3, 10], [0, 1, 9, 16, 100]),
        ([-7, -3, 2, 3, 11], [4, 9, 9, 49, 121]),
    ]
    
    @Test("977. Squares of a Sorted Array", arguments: testCases)
    func runSolution(input: [Int], expected: [Int]) async throws {
        #expect(solution.sortedSquares(input) == expected)
    }
    
    @Test("977. Squares of a Sorted Array", arguments: testCases)
    func runSolution2(input: [Int], expected: [Int]) async throws {
        #expect(solution.sortedSquares2(input) == expected)
    }
}
