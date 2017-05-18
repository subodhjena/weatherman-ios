//
//  APIManager.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class APIManager {
    
    fileprivate let manager: SessionManagerProtocol
    
    private init() {
        self.manager = SessionManager()
    }
    
    static let sharedInstance: APIManager = APIManager()
    
    // MARK :- Weather
    
    func getWeatherByCityName(cityName: String, completionHandler: @escaping (APIResult<WeatherData>) -> Void) {
        
        manager.apiRequest(endpoint: Endpoints.Weather.GetWeather(cityName: cityName, appId: API.appID), parameters: nil, headers: nil).responseJSON { (response) in
            
            switch response.result {
            case .success(let json):
                let weatherJSON = JSON(json)
                let weatherData = WeatherData(json: weatherJSON)
                completionHandler(APIResult{ return weatherData })
            case .failure(let error):
                completionHandler(APIResult{ throw error })
            }
            
        }
    }
    
    // MARK :- Forecast
    
    func getForecastByCityName(cityName: String, completionHandler: @escaping (APIResult<ForecastData>) -> Void) {
        
        manager.apiRequest(endpoint: Endpoints.Forecast.GetForecast(cityName: cityName, appId: API.appID), parameters: nil, headers: nil).responseJSON { (response) in
            
            switch response.result {
            case .success(let json):
                let forecastJSON = JSON(json)
                let forecastData = ForecastData(json: forecastJSON)
                completionHandler(APIResult{ return forecastData })
            case .failure(let error):
                completionHandler(APIResult{ throw error })
            }
        }
    }
}

