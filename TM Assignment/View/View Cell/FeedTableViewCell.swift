//
//  FeedTableViewCell.swift
//  TM Assignment
//
//  Created by apple on 12/27/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import SDWebImage
class FeedTableViewCell: UITableViewCell {

    @IBOutlet weak var CommentView: UIView!
    @IBOutlet weak var feedCommentsLabel: UILabel!
    @IBOutlet weak var feedUserNameLabel: UILabel!
    @IBOutlet weak var feedMassageLabel: UILabel!
    @IBOutlet weak var feedImageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func confiqureUserCell(item: UserFeedResponceModal){
        self.feedImageview.sd_setImage(with: URL(string: item.image!), placeholderImage: #imageLiteral(resourceName: "images"))
        self.feedMassageLabel.text = item.message
        self.feedCommentsLabel.text = "\(item.commentModalList!.count) Comments"
        self.feedUserNameLabel.text = "UserId:\(item.userId!)"
    
    }

}
