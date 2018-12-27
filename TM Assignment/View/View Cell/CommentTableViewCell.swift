//
//  CommentTableViewCell.swift
//  TM Assignment
//
//  Created by apple on 12/27/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var commentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func confiqureUserCell(item: CommentsModal){
        self.commentLabel.text = item.message
    }
}
