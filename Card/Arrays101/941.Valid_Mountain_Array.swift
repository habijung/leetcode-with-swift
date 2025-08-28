//
//  941.Valid_Mountain_Array.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 7/20/25.
//

import Foundation
import Testing

class Solution941 {
    func validMountainArray(_ arr: [Int]) -> Bool {
        guard arr.count >= 3 else {
            return false
        }
        
        var up = false
        var down = false
        
        for i in 1 ..< arr.count {
            guard arr[i - 1] != arr[i] else {
                return false
            }
            
            // Increase Direction
            if !down && arr[i - 1] < arr[i] {
                up = true
                continue
            }
            
            // Decrease Direction
            if up && arr[i - 1] > arr[i] {
                down = true
                continue
            } else {
                return false
            }
        }
        
        return up && down
    }
}

struct Test941 {
    let solution = Solution941()
    static let testCases: [(arr: [Int], expected: Bool)] = [
        ([1, 2, 3, 2, 1], true),
        ([0, 2, 3, 3, 5, 2, 1, 0], false),
        ([2, 1], false),
        ([3, 5, 5], false),
        ([0, 3, 2, 1], true),
        ([5, 6, 7, 5, 3, 2], true),
        ([0, 1, 2, 3], false),
    ]

    @Test("941. Valid Mountain Array", arguments: testCases)
    func runSolution(arr: [Int], expected: Bool) async throws {
        #expect(solution.validMountainArray(arr) == expected)
    }
}
