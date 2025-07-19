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
    
    func duplicateZeros2(_ arr: inout [Int]) {
        var zerosCount = 0
        
        // 전체 0의 개수 확인
        for num in arr {
            if num == 0 {
                zerosCount += 1
            }
        }
        
        // arr를 뒤에서부터 읽으면서 값이 0을 확장한 arr 범위에 있으면 추가
        var readIndex = arr.count - 1
        var writeIndex = arr.count - 1 + zerosCount
        
        while readIndex >= 0 {
            if writeIndex < arr.count {
                arr[writeIndex] = arr[readIndex]
            }
                
            if arr[readIndex] == 0 {
                writeIndex -= 1
                
                if writeIndex < arr.count {
                    arr[writeIndex] = arr[readIndex]
                }
            }
            
            readIndex -= 1
            writeIndex -= 1
        }
    }
}

struct Test1089 {
    let solution = Solution1089()
    
    static let testCases: [(input: [Int], expected: [Int])] = [
        ([1, 0, 2, 3, 0, 4, 5, 0], [1, 0, 0, 2, 3, 0, 0, 4]),
        ([1, 2, 3], [1, 2, 3]),
        ([1, 0], [1, 0]),
        ([0], [0]),
    ]
    
    @Test("1089. Duplicate Zeros", arguments: testCases)
    func runSolution(input: [Int], expected: [Int]) async throws {
        var arr = input
        
        solution.duplicateZeros(&arr)
        
        #expect(arr == expected)
    }
    
    @Test("1089. Duplicate Zeros 2", arguments: testCases)
    func runSolution2(input: [Int], expected: [Int]) async throws {
        var arr = input
        
        solution.duplicateZeros2(&arr)
        
        #expect(arr == expected)
    }
}
