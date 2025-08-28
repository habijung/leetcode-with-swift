//
//  88.Merge_Sorted_Array.swift
//  LeetcodeWithSwift
//
//  Created by habijung on 7/19/25.
//

import Foundation
import Testing

class Solution88 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index1 = m == 0 ? 0 : m - 1
        var index2 = n - 1
        var writeIndex = m + n - 1

        while index1 >= 0, index2 >= 0 {
            if nums1[index1] <= nums2[index2] {
                nums1[writeIndex] = nums2[index2]
                index2 -= 1
            } else {
                nums1[writeIndex] = nums1[index1]
                index1 -= 1
            }

            writeIndex -= 1
        }

        // 마지막에 nums2의 element가 남았을 때 업데이트
        while index2 >= 0 {
            nums1[index2] = nums2[index2]
            index2 -= 1
        }
    }
}

struct Test88 {
    let solution = Solution88()

    static let testCases: [(nums1: [Int], m: Int, nums2: [Int], n: Int, expected: [Int])] = [
        ([1, 2, 3, 0, 0, 0], 3, [2, 5, 6], 3, [1, 2, 2, 3, 5, 6]),
        ([1], 1, [], 0, [1]),
        ([0], 0, [1], 1, [1]),
        ([2, 0], 1, [1], 1, [1, 2]),
        ([4, 5, 6, 0, 0, 0], 3, [1, 2, 3], 3, [1, 2, 3, 4, 5, 6]),
        ([0, 0, 0], 0, [-10, 0, 10], 3, [-10, 0, 10]),
        ([-5, 0, 0, 0], 1, [-10, 0, 10], 3, [-10, -5, 0, 10]),
    ]

    @Test("88. Merge Sorted Array", arguments: testCases)
    func runSolution(nums1: [Int], m: Int, nums2: [Int], n: Int, expected: [Int]) async throws {
        var nums1 = nums1
        solution.merge(&nums1, m, nums2, n)
        #expect(nums1 == expected)
    }
}
