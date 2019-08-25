//
//  Extensions.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 26/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import Foundation

extension String {
    subscript(_ range: CountableRange<Int>) -> String {
        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
        return String(self[idx1..<idx2])
    }
}
