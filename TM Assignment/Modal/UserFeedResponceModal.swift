//
//  UserFeedResponceModal.swift
//  TM Assignment
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import ObjectMapper

class UserFeedResponceModal: Mappable {
    
    var id:Int?
    var userId:Int?
    var message:String?
    var image:String?
    var commentModalList: [CommentsModal]?
    
    
    required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
       id <- map ["id"]
       userId <- map ["user_id"]
       message <- map ["message"]
       image <- map ["image"]
       commentModalList <- map ["comments"]
    }
    
    
}
