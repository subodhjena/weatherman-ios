//
//  Rain.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/18/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Rain {
    public var h : Double?
}

extension Rain {
    
    init(json: JSON) {
    
        h = json["3h"].doubleValue
    }
}
