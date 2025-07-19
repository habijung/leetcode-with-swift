//
//  Template.swift
//  LeetcodeWithSwift
//
//  Created by hbjung on 7/16/25.
//

import Foundation
import Testing

class SolutionNum {
    func funcDefault(_ num: Int) -> Int {
        return num
    }

    func funcInout(_ nums: inout [Int]) {
        // Write your code.
    }
}

struct TestNum {
    let solution = SolutionNum()

    // Test for default function
    static let testCases: [(input: Int, expected: Int)] = [
        (0, 0),
        (1, 1),
    ]

    @Test("Num. Title", arguments: testCases)
    func runSolution(input: Int, expected: Int) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        #expect(solution.funcDefault(input) == expected)
    }

    // Test for inout function
    static let testCasesInout: [(input: [Int], expected: [Int])] = [
        ([0, 0], [0, 0]),
        ([1, 2, 3], [1, 2, 3]),
    ]

    @Test("Num. Title for inout", arguments: testCasesInout)
    func runSolutionInout(input: [Int], expected: [Int]) async throws {
        var input = input
        solution.funcInout(&input)
        #expect(input == expected)
    }
}
