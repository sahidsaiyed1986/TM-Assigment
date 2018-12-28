//
//  UserFeedViewModal.swift
//  TM Assignment
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit

class UserFeedViewModal: NSObject {
    //Create apiClient property that we can use to call in our API Call.
    //This apiClient property is marked as an @IBOutlet so that we can instantiate it from the storyboard.  I mark this with a bang operator (!) since I know it will not be nil since the storyboard will be injecting it.
   @IBOutlet weak var apiClient: ApiClient!
    var usersfeedList = [UserFeedResponceModal]()

    func getUsersFeed(complete:@escaping GetFeedComplete)  {
        self.apiClient.GetFeed {
            self.usersfeedList = self.apiClient._usersFeedList
            complete()
        }
    }
       
}
