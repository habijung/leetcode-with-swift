//
//  1957.DeleteCharactersToMakeFancyString.swift
//  LeetcodeWithSwift
//
//  Created by hbjung on 7/21/25.
//

import Foundation
import Testing

class Solution1957 {
    func makeFancyString(_ s: String) -> String {
        var arr: [Character] = []
        
        guard !s.isEmpty else {
            return ""
        }
        
        for char in s {
            let count = arr.count
            
            if count >= 2 && char == arr[count - 2] && char == arr[count - 1] {
                continue
            }
            
            arr.append(char)
        }
        
        return String(arr)
    }
}

struct Test1957 {
    let solution = Solution1957()
    static let testCases: [(s: String, expected: String)] = [
        ("a", "a"),
        ("aaabaaaa", "aabaa"),
        ("leeetcode", "leetcode"),
    ]
    
    @Test("1957. Delete Characters to Make Fancy String", arguments: testCases)
    func runSolution(s: String, expected: String) async throws {
        #expect(solution.makeFancyString(s) == expected)
    }
}
