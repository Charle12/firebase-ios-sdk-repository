//
//  IssueTableCellDetailModel.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import Foundation

class IssueTableCellDetailModel {
    
    private let comment: Comment
    
    init(comment: Comment) {
        self.comment = comment
    }
    
    var body: String {
        if let body = comment.body {
            return body
        }
        return constants.EMPTY_STRING
    }
}
