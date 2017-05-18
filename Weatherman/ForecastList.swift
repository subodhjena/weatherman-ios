//
//  ForecastList.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/18/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ForecastList {
    
    public var dt : Int?
    public var main : Main?
    public var weather : [Weather]?
    public var clouds : Clouds?
    public var wind : Wind?
    public var rain : Rain?
    public var sys : Sys?
    public var dateTxt : String?
}

extension ForecastList {
    
    init(json: JSON) {
        
        dt = json["id"].intValue
        main = Main(json: json["main"])
        weather = json.arrayValue.map{ Weather(json: $0) }
        clouds = Clouds(json: json["clouds"])
        wind = Wind(json: json["wind"])
        rain = Rain(json: json["rain"])
        sys = Sys(json: json["sys"])
        dateTxt = json["dt_txt"].stringValue
    }
}
