//
//  Coord.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Coord {
    public var lon : Double?
    public var lat : Double?
}

extension Coord {
    
    init(json: JSON) {
        
        lon = json["lon"].double
        lat = json["lat"].double
    }
}
