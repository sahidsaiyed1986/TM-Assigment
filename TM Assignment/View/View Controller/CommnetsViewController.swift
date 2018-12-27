//
//  CommnetsViewController.swift
//  TM Assignment
//
//  Created by apple on 12/27/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class CommnetsViewController: UIViewController {

    @IBOutlet weak var commentsTableView: UITableView!
    var usersFeedModel:UserFeedResponceModal!
    var commentsModal = [CommentsModal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.commentsTableView.delegate = self
        self.commentsTableView.dataSource = self
        commentsModal = usersFeedModel.commentModalList!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
// MARK: TABLEVIEW DELEGATE METHODS
extension CommnetsViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0
        {
            return 1
        }
        else{
            return commentsModal.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0
        {
        let feedCell = tableView.dequeueReusableCell(withIdentifier: "feedcell", for: indexPath) as! FeedTableViewCell
            feedCell.confiqureUserCell(item: self.usersFeedModel)
        return feedCell
        }
        else{
            let commentCell = tableView.dequeueReusableCell(withIdentifier: "commentcell", for: indexPath) as! CommentTableViewCell
            commentCell.confiqureUserCell(item: self.commentsModal[indexPath.row])
            return commentCell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1
        {
            let label = UILabel()
            label.text = "\(commentsModal.count) Comments"
            return label
        }
        return nil
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 50
        }
        return 0
    }
    
    
    
}
