//
//  IssueTableCellDetailModel.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import Foundation

class IssueTableCellDetailModel {
    
    private let issue: Issue
    
    init(issue: Issue) {
        self.issue = issue
    }
    
    var body: String {
        if let body = issue.body {
            return body
        }
        return constants.EMPTY_STRING
    }
}
