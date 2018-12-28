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
    var isDataLoading:Bool=false
    
    
    
    
   @IBOutlet var userFeedViewModal: UserFeedViewModal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "FEED"
        self.startloading()
        self.gateNewFeed()
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
     // get new feed
    func gateNewFeed(){
      
        self.userFeedViewModal.getUsersFeed {
            self.usersFeedModel = Array(self.userFeedViewModal.usersfeedList)
            print(self.usersFeedModel.count)
            self.isDataLoading = false
            self.feedTableView.reloadData()
           self.stopLoading()
        }
    }
     // start loading
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
    func navigateToCommentView(item:UserFeedResponceModal)  {
        let commentViewController = self.storyboard!.instantiateViewController(withIdentifier: "commentsview") as! CommnetsViewController
        commentViewController.usersFeedModel = item
        self.navigationController!.pushViewController(commentViewController, animated: true)
    }
   
}
// MARK: TABLEVIEW DELEGATE METHODS
extension ViewController:UITableViewDelegate,UITableViewDataSource{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersFeedModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let feedCell = tableView.dequeueReusableCell(withIdentifier: "feedcell", for: indexPath) as! FeedTableViewCell
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        feedCell.CommentView.addGestureRecognizer(tapGesture)
        feedCell.CommentView.isUserInteractionEnabled = true
        feedCell.confiqureUserCell(item: self.usersFeedModel[indexPath.row])
        feedCell.selectionStyle = UITableViewCell.SelectionStyle.none
        return feedCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigateToCommentView(item: self.usersFeedModel[indexPath.row])
    }


    //commentView tapped
    @objc func viewTapped(sender: UITapGestureRecognizer) {
        let view:UIView = sender.view!
        let viewPosition:CGPoint = view.convert(CGPoint.zero, to: self.feedTableView)
        let indexPath:IndexPath = self.feedTableView.indexPathForRow(at: viewPosition)! as IndexPath
        self.navigateToCommentView(item: self.usersFeedModel[indexPath.row])
    }
    
}
// MARK: ScrollView DELEGATE METHODS
extension ViewController:UIScrollViewDelegate{



    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDataLoading = false
    }



    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {

    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {


        if ((feedTableView.contentOffset.y + feedTableView.frame.size.height) >= feedTableView.contentSize.height)
        {
            if !isDataLoading{
                isDataLoading = true
                self.gateNewFeed()

            }
        }
    }
}

