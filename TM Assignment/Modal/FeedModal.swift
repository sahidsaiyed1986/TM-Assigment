//
//  FeedModal.swift
//  TM Assignment
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import ObjectMapper

class FeedModal: Mappable {
    
    var status: String?
    var message: String?
    var userFeelModalList: [UserFeedResponceModal]?
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map ["status"]
        message <- map ["message"]
        userFeelModalList <- map ["response"]
    }
    
    
   
}
