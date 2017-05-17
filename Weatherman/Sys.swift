//
//  Sys.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Sys {
    public var type : Int?
    public var id : Int?
    public var message : Double?
    public var country : String?
    public var sunrise : Int?
    public var sunset : Int?
}

extension Sys {
    
    init(json: JSON) {
        
        type = json["type"].intValue
        id = json["id"].intValue
        message = json["message"].doubleValue
        country = json["country"].stringValue
        sunrise = json["sunrise"].intValue
        sunset = json["sunset"].intValue
    }
}
