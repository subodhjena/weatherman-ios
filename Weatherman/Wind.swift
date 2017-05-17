//
//  Wind.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Wind {
    public var speed : Double?
    public var deg : Int?
}

extension Wind {
    
    init(json: JSON) {
        
        speed = json["speed"].doubleValue
        deg = json["deg"].intValue
    }
}


