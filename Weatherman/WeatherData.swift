//
//  WeatherData.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON


struct WeatherData {
    
    public var coord : Coord?
    public var weather : [Weather]?
    public var base : String?
    public var main : Main?
    public var visibility : Int?
    public var wind : Wind?
    public var clouds : Clouds?
    public var dt : Int?
    public var sys : Sys?
    public var id : Int?
    public var name : String?
    public var cod : Int?
}

extension WeatherData {
    
    init(json: JSON) {
        
        coord = Coord(json: json["coord"])
        weather = json.arrayValue.map{ Weather(json: $0) }
        base = json["base"].stringValue
        main = Main(json: json["main"])
        visibility = json["visibility"].intValue
        wind = Wind(json: json["wind"])
        clouds = Clouds(json: json["clouds"])
        dt = json["dt"].intValue
        sys = Sys(json: json["sys"])
        id = json["id"].intValue
        name = json["name"].stringValue
        cod = json["cod"].intValue
    }
}
