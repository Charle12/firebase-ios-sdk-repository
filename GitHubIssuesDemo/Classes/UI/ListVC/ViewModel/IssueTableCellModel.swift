//
//  IssueTableCellModel.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import Foundation

class IssueTableCellModel {
    
    private let issue: Issue
    
    init(issue: Issue) {
        self.issue = issue
    }

    var title: String {
        return issue.title ?? constants.EMPTY_STRING
    }
    var commentDetail: IssueTableCellDetailModel? 
    
    var body: NSMutableAttributedString {
        if let body = issue.body {
            if body.count > 140 {
                return Utility.createAttributedText(fullStr: String(format: "%@...SeeFull", body[0..<140]), toColor: "SeeFull", colour: UIColor.blue)
            } else {
                return NSMutableAttributedString.init(string: body)
            }
        }
        return NSMutableAttributedString.init(string: constants.EMPTY_STRING)
    }
    
    var number: Int {
        return issue.number ?? 0
    }
}



