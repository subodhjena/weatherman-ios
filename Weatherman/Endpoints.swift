//
//  Endpoints.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import Alamofire

enum Endpoints {
    
    enum Weather: EndpointProtocol {
        
        case GetWeather(cityName: String, appId: String)
        
        var method: HTTPMethod {
            switch self {
            case .GetWeather:
                return .get
            }
        }
        
        public var path: String {
            switch self {
            case .GetWeather(let cityName, let appID):
                return "weather?q=\(cityName)&appid=\(appID)"
            }
        }
        
        var url: String {
            
            let baseUrl = API.baseUrl
            
            switch self {
            case .GetWeather:
                return "\(baseUrl)\(path)"
            }
        }
    }

    enum Forecast: EndpointProtocol {
        
        case GetForecast()
        
        var method: HTTPMethod {
            switch self {
            case .GetForecast:
                return .get
            }
        }
        
        public var path: String {
            switch self {
            case .GetForecast():
                return "forecast"
            }
        }
        
        var url: String {
            
            let baseUrl = API.baseUrl
            
            switch self {
            case .GetForecast:
                return "\(baseUrl)\(path)"
            }
        }
    }
}

