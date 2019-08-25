//
//  CommentTVC.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import UIKit

class CommentTVC: UITableViewCell {
    
    @IBOutlet weak var lblForDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public var viewModel: IssueTableCellDetailModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.lblForDescription.text = viewModel.body
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
}
