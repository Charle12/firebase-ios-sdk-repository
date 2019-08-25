//
//  IssueDetailVC.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import UIKit

class IssueDetailVC: UIViewController {
    
    var number: Int?
    @IBOutlet weak var tableForIssueComment: UITableView!
    private let client = ApiClient()
    
    private let viewModel = IssueDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchIssueCommentsFromApi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = constants.vcTitle.TITLE_ISSUE_DETAIL
    }
    
    func fetchIssueCommentsFromApi() {
        if IssueDao.shared.isNetworkConnected() {
            SharedActivity.sharedInstance()?.start()
            client.getIssueCommentDetail(from: .issueDetail(self.number)) { result in
                weak var weakSelf = self
                SharedActivity.sharedInstance()?.stop()
                switch result {
                case .success(let result):
                    if let comment = result, comment.count > 0 {
                        weakSelf?.viewModel.getCommentsList(comments: comment)
                        weakSelf?.tableForIssueComment.reloadData()
                    } else {
                        IssueDao.shared.showErrorAlert(title: constants.APP_NAME, message: constants.ERROR_MESSAGE, obj: self)
                    }
                case .failure(let error):
                    print("the error \(error)")
                    IssueDao.shared.showErrorAlert(title: constants.APP_NAME, message: "the error \(error)", obj: self)
                }
            }
        } else {
            SharedActivity.sharedInstance()?.stop()
            IssueDao.shared.showErrorAlert(title: constants.APP_NAME, message: constants.ERROR_NETWORK, obj: self)
        }
    }
}

extension IssueDetailVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CommentTVC = tableView.dequeueReusableCell(withIdentifier: CommentTVC.identifier, for: indexPath) as! CommentTVC
        cell.selectionStyle = .none
        if self.viewModel.count > 0 {
            let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
            cell.viewModel = cellViewModel
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


