//
//  CommnetsModal.swift
//  TM Assignment
//
//  Created by apple on 12/26/18.
//  Copyright © 2018 apple. All rights reserved.
//

import Foundation
import ObjectMapper

class CommentsModal: Mappable {
    var message:String?
    
    required init?(map: Map) {
        
    }
    
     func mapping(map: Map) {
        message <- map ["message"]
    }
    
    
}
