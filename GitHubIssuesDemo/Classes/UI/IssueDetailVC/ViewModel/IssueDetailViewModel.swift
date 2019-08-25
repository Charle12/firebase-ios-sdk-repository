//
//  IssueDetailViewModel.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import Foundation

class IssueDetailViewModel {
    
    private var issues:[Issue] = [Issue]()
    
    public func getCommentsList(issues: [Issue]) {
        self.issues = issues
    }
    
    public func cellViewModel(index: Int) -> IssueTableCellDetailModel? {
        let issueTableCellDetailModel = IssueTableCellDetailModel(issue: issues[index])
        return issueTableCellDetailModel
    }
    
    public var count: Int {
        return issues.count
    }
}
