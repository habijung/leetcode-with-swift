//
//  27.RemoveElement.swift
//  LeetcodeWithSwift
//
//  Created by habi on 7/19/25.
//

import Foundation
import Testing

class Solution27 {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        guard !nums.isEmpty else {
            return 0
        }

        var maxIndex = nums.count - 1

        if nums[maxIndex] == val {
            // 빈 index는 -1로 설정
            nums[maxIndex] = -1
            maxIndex -= 1
        }

        for i in stride(from: maxIndex, through: 0, by: -1) {
            if nums[i] == val {
                if i == maxIndex {
                    maxIndex -= 1
                    continue
                }

                for j in i + 1 ... maxIndex {
                    nums[j - 1] = nums[j]

                    // 빈 index는 -1로 설정
                    if j == maxIndex {
                        nums[j] = -1
                    }
                }

                maxIndex -= 1
            }
        }

        return maxIndex + 1
    }

    func removeElement2(_ nums: inout [Int], _ val: Int) -> Int {
        // nums가 empty이면 return 0
        guard !nums.isEmpty else {
            return 0
        }

        var writeIndex = 0

        for (index, num) in nums.enumerated() {
            // num을 사용하고 현재 index의 값 비워주기
            nums[index] = -1

            guard num != val else {
                continue
            }

            // 현재 num을 저장하려고 하는 index로 이동
            nums[writeIndex] = num
            writeIndex += 1
        }

        return writeIndex
    }
}

struct Test27 {
    let solution = Solution27()
    static let testCases: [(nums: [Int], val: Int, expected: Int)] = [
        ([3, 2, 2, 3], 3, 2),
        ([0, 1, 2, 2, 3, 0, 4, 2], 2, 5),
        ([], 0, 0),
        ([3, 3], 3, 0),
        ([3, 3, 3], 3, 0),
    ]

    @Test("27. Remove Element", arguments: testCases)
    func runSolution(nums: [Int], val: Int, expected: Int) async throws {
        var nums = nums
        #expect(solution.removeElement(&nums, val) == expected)
    }

    @Test("27. Remove Element (2)", arguments: testCases)
    func runSolution2(nums: [Int], val: Int, expected: Int) async throws {
        var nums = nums
        #expect(solution.removeElement2(&nums, val) == expected)
    }
}
