//
//  HomeInteractor.swift
//  Weatherman
//
//  Created by Subodh Jena on 17/05/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation

class HomeInteractor: HomeInteractorInput {
    
    weak var output: HomeInteractorOutput!
    
    func fetchWeatherData(cityName: String) {
        
        APIManager.sharedInstance.getWeatherByCityName(cityName: cityName) { (result) in
            do {
                let data = try result.unwrap()
                self.output.weatherDataFetched(weatherData: data)
            }
            catch let error as NSError {
                self.output.weatherDataFetchFailed(message: error.localizedDescription)
            }
        }
    }
    
    func fetchForecastData(cityName: String) {
        
        APIManager.sharedInstance.getForecastByCityName(cityName: cityName) { (result) in
            
            do {
                let data = try result.unwrap()
                self.output.forecastDataFetched(forecastData: data)
            }
            catch let error as NSError {
                self.output.forecastDataFetchFailed(message: error.localizedDescription)
            }
        }
    
    }
}
