//
//  1089.DuplicateZeros.swift
//  RunCode
//
//  Created by habi on 7/19/25.
//

import Foundation
import Testing

class Solution1089 {
    func duplicateZeros(_ arr: inout [Int]) {
        var count = 0
        
        for num in arr {
            if num == 0 {
                count += 1
            }
        }
        
        var arrCopy: [Int] = Array(repeating: 0, count: arr.count + count)
        var index = 0
        
        for num in arr {
            arrCopy[index] = num
            
            if num == 0, index + 1 < arrCopy.count {
                arrCopy[index + 1] = 0
                index += 1
            }
            
            index += 1
        }
        
        arr = Array(arrCopy[..<arr.count])
    }
}

struct Test1089 {
    let solution = Solution1089()

    static let testCases: [(input: [Int], expected: [Int])] = [
        ([1, 0, 2, 3, 0, 4, 5, 0], [1, 0, 0, 2, 3, 0, 0, 4]),
        ([1, 2, 3], [1, 2, 3]),
        ([1, 0], [1, 0]),
    ]
    
    @Test("1089. Duplicate Zeros", arguments: testCases)
    func runSolution(input: [Int], expected: [Int]) async throws {
        var arr = input
        
        solution.duplicateZeros(&arr)
        
        #expect(arr == expected)
    }
}
