
//
//  IssueTVC.swift
//  GitHubIssuesDemo
//
//  Created by Prabhat Pandey on 25/08/19.
//  Copyright © 2019 Prabhat Pandey. All rights reserved.
//

import UIKit

class IssueTVC: UITableViewCell {
    
    @IBOutlet weak var lblForTitle: UILabel!
    @IBOutlet weak var lblForDescription: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public var viewModel: IssueTableCellModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            self.lblForTitle.text = viewModel.title
            self.lblForDescription.attributedText = viewModel.body
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
