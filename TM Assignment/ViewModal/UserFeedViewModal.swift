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
     var apiClient:ApiClient = ApiClient()
    
    var usersfeedList = [UserFeedResponceModal]()

    func getUsersFeed(complete:@escaping GetFeedComplete)  {
        self.apiClient.GetFeed {
            self.usersfeedList = self.apiClient._usersFeedList
            complete()
        }
    }
       
}
