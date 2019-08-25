//
//  EndPoint.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import Foundation

protocol Endpoint {
    
    var base: String { get }
    var path: String { get }
}

extension Endpoint {
    
    var query: String {
        return "state=all&sort=updated&direction=desc&since=2015-08-25T18:46:19Z"
    }
    
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        components.query = query
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        return URLRequest(url: url)
    }
}

enum IssueFeed {
    case issueList
    case issueDetail(_ number: Int?)
}

extension IssueFeed: Endpoint {
    
    var base: String {
        return "https://api.github.com"
    }
    
    var path: String {
        switch self {
        case .issueList: return "/repos/firebase/firebase-ios-sdk/issues"
        case .issueDetail(let number): return "/repos/firebase/firebase-ios-sdk/issues/\(number ?? 0)/comments"
        }
    }
}










