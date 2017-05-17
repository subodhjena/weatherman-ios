//
//  Weather.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Weather {
    public var id : Int?
    public var main : String?
    public var description : String?
    public var icon : String?
}

extension Weather {
    
    init(json: JSON) {
        
        id = json["id"].intValue
        main = json["main"].stringValue
        description = json["description"].stringValue
        icon = json["icon"].stringValue
    }
}

