//
//  Issue.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import Foundation

struct Issue: Decodable {
    let title: String?
    let number: Int?
    let body: String?
}
