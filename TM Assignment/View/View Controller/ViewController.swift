//
//  ViewController.swift
//  TM Assignment
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var feedTableView: UITableView!
    var usersFeedModel = [UserFeedResponceModal]()
    var activityIndicatorView: ActivityIndicatorView!
    
    @IBOutlet var userFeedViewModal: UserFeedViewModal!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "FEED"
        feedTableView.delegate = self
        feedTableView.dataSource = self
        self.gateNewFeed()
        
    }
    func gateNewFeed(){
        self.startloading()
        self.userFeedViewModal.getUsersFeed {
            self.usersFeedModel = Array(self.userFeedViewModal.usersfeedList)
            print(self.usersFeedModel.count)
            self.stopLoading()
            self.feedTableView.reloadData()
        }
    }
    func startloading()
    {
        self.activityIndicatorView = ActivityIndicatorView(title: "Fetching Feeds...", center: self.view.center,controller:self)
        self.view.addSubview(self.activityIndicatorView.getViewActivityIndicator())
        self.activityIndicatorView.startAnimating()
        
    }
    // stop loading
    func stopLoading()
    {
        self.activityIndicatorView.stopAnimating()
    }
   
}
// MARK: TABLEVIEW DELEGATE METHODS
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersFeedModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feedCell = tableView.dequeueReusableCell(withIdentifier: "feedcell", for: indexPath) as! FeedTableViewCell
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        feedCell.CommentView.addGestureRecognizer(tapGesture)
        feedCell.CommentView.isUserInteractionEnabled = true
        feedCell.confiqureUserCell(item: self.usersFeedModel[indexPath.row])
        return feedCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //commentView tapped
    @objc func viewTapped(sender: UITapGestureRecognizer) {
       
        print("testing-testing")
    }
    
}
// MARK: ScrollView DELEGATE METHODS
extension ViewController:UIScrollViewDelegate{
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        
        let currentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        
       
        if maximumOffset - currentOffset <= 20.0 {
            self.gateNewFeed()
        }
    }
}

