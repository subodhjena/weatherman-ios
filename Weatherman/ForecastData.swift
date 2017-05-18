//
//  ForecastData.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/18/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ForecastData {
    
    public var cod : Int?
    public var message : Double?
    public var cnt : Int?
    public var list : [ForecastList]?
    public var city : City?
}

extension ForecastData {
    
    init(json: JSON) {
        
        cod = json["cod"].intValue
        message = json["message"].doubleValue
        cnt = json["cnt"].intValue
        list = json["list"].arrayValue.map{ ForecastList(json: $0) }
        city = City(json: json["city"])
    }
}
