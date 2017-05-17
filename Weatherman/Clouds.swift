//
//  Clouds.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Clouds {
    
    public var all : Int?
}

extension Clouds {
    
    init(json: JSON) {
        all = json["all"].int!
    }
}
