//
//  1346.CheckIfNAndItsDoubleExist.swift
//  LeetcodeWithSwift
//
//  Created by habi on 7/20/25.
//

import Foundation
import Testing

class Solution1346 {
    func checkIfExist(_ arr: [Int]) -> Bool {
        guard !arr.isEmpty else {
            return false
        }

        for i in 0 ..< arr.count {
            for j in 0 ..< arr.count {
                guard j != i else {
                    continue
                }

                guard arr[i] % 2 == 0 else {
                    continue
                }

                if arr[i] == arr[j] * 2 {
                    return true
                }
            }
        }

        return false
    }

    func checkIfExist2(_ arr: [Int]) -> Bool {
        guard !arr.isEmpty else {
            return false
        }

        var numset = Set<Int>()

        for num in arr {
            // 현재 값 * 2 확인
            if numset.contains(num * 2) {
                return true
            }

            // 현재 값이 짝수이고, 값 / 2 확인
            if num % 2 == 0 && numset.contains(num / 2) {
                return true
            }

            // 확인이 끝나면 추가
            numset.insert(num)
        }

        return false
    }
}

struct Test1346 {
    let solution = Solution1346()
    static let testCases: [(arr: [Int], expected: Bool)] = [
        ([10, 2, 5, 3], true),
        ([6, 10, 5, 3], true),
        ([2, 5, 10, 3], true),
        ([-4, -4, -3, -2], true),
        ([7, 1, 14, 11], true),
        ([3, 1, 7, 11], false),
        ([0, -2, 2], false),
    ]

    @Test("1346. Check If N and Its Double Exist", arguments: testCases)
    func runSolution(arr: [Int], expected: Bool) async throws {
        #expect(solution.checkIfExist(arr) == expected)
    }

    @Test("1346. Check If N and Its Double Exist (2)", arguments: testCases)
    func runSolution2(arr: [Int], expected: Bool) async throws {
        #expect(solution.checkIfExist2(arr) == expected)
    }
}
