//
//  IssueDetailViewModel.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import Foundation

class IssueDetailViewModel {
    
    private var comments:[Comment] = [Comment]()
    
    public func getCommentsList(comments: [Comment]) {
        self.comments = comments
    }
    
    public func cellViewModel(index: Int) -> IssueTableCellDetailModel? {
        let issueTableCellDetailModel = IssueTableCellDetailModel(comment: comments[index])
        return issueTableCellDetailModel
    }
    
    public var count: Int {
        return comments.count
    }
}
