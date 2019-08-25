//
//  IssueListViewModel.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import Foundation

class IssueListViewModel {
    
    private var issues:[Issue] = [Issue]()
    
    public func getIssuesList(issued: [Issue]) {
        self.issues = issued
    }
    
    public func cellViewModel(index: Int) -> IssueTableCellModel? {
        let issueTableCellModel = IssueTableCellModel(issue: issues[index])
        return issueTableCellModel
    }
    
    public var count: Int {
        return issues.count
    }
    
    public func selectedUserLogin(index: Int) -> Int {
        return issues[index].number ?? 0
    }
}

