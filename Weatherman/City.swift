//
//  City.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/18/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON


struct City {
    public var id : Int?
    public var name : String?
    public var coord : Coord?
    public var country : String?
}

extension City {
   
    init(json: JSON) {
        
        id = json["id"].intValue
        name = json["name"].stringValue
        coord = Coord(json: json["coord"])
        country = json["country"].stringValue
    }
}
