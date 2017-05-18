//
//  Main.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Main {
    
    public var temp : Double?
    public var pressure : Int?
    public var humidity : Int?
    public var temp_min : Double?
    public var temp_max : Double?
    public var sea_level : Double?
    public var grnd_level : Double?
    public var temp_kf : Double?
}

extension Main {
    
    init(json: JSON) {
        
        temp = json["temp"].doubleValue
        pressure = json["pressure"].intValue
        humidity = json["humidity"].intValue
        temp_min = json["temp_min"].doubleValue
        temp_max = json["temp_max"].doubleValue
        sea_level = json["sea_level"].doubleValue
        grnd_level = json["grnd_level"].doubleValue
        temp_kf = json["temp_kf"].doubleValue
    }
}



