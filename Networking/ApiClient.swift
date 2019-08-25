//
//  ApiClient.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import UIKit

class ApiClient: GenericAPIClient {
    let session: URLSession
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    //in the signature of the function in the success case we define the Class type thats is the generic one in the API
    func getIssueListFeed(from feedType: IssueFeed, completion: @escaping (Result<Array<Issue>?, APIError>) -> Void) {
        let endpoint = feedType
        let request = endpoint.request
        fetch(with: request, decode: { json -> Array<Issue>? in
            guard let issueList = json as? Array<Issue> else { return  nil }
            return issueList
        }, completion: completion)
    }
    
    //in the signature of the function in the success case we define the Class type thats is the generic one in the API
    func getIssueCommentDetail(from feedType: IssueFeed, completion: @escaping (Result<Array<Issue>?, APIError>) -> Void) {
        let endpoint = feedType
        let request = endpoint.request
        fetch(with: request, decode: { json -> Array<Issue>? in
            guard let issueDetail = json as? Array<Issue> else { return  nil }
            return issueDetail
        }, completion: completion)
    }
}
