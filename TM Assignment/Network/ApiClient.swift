//
//  ApiClient.swift
//  TM Assignment
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

// this API Clicent will be called by the viewModel to get feed from API.
class ApiClient: NSObject {
    
    var _usersFeedList = [UserFeedResponceModal] ()
    
    var usersFeedList: [UserFeedResponceModal] {
        return _usersFeedList
    }
    


    
    func GetFeed(complete: @escaping GetFeedComplete) {
                Alamofire.request(FEEDURL).responseObject{ (response: DataResponse<FeedModal>) in
        
                    let list = response.result.value
        
                    if let usersModel = list?.userFeelModalList {
        
                        for(_ , user) in usersModel.enumerated() {
        
                            self._usersFeedList.append(user)
                        }
                    }
                    complete()
                }
            }
    
    }

