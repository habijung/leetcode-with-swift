//
//  Template.swift
//  LeetcodeWithSwift
//
//  Created by hbjung on 7/16/25.
//

import Foundation
import Testing

class SolutionNum {
    func funcName(_ num: Int) -> Int {
        return num
    }
}

struct TestNum {
    let solution = SolutionNum()
    
    static let testCases: [(input: Int, expected: Int)] = [
        (0, 0),
        (1, 1),
    ]

    @Test("Num. Title", arguments: testCases)
    func runSolution(input: Int, expected: Int) async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        #expect(solution.funcName(input) == expected)
    }
}
