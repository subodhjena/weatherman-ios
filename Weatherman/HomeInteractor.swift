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
    
    func fetchWeatherData() {
        
        APIManager.sharedInstance.getWeatherByCityName(cityName: "Delhi") { (result) in
            do {
                let data = try result.unwrap()
                self.output.weatherDataFetched(weatherData: data)
            }
            catch let error as NSError {
                debugPrint("Get Weather Data Error: \(error.localizedDescription)")
                self.output.weatherDataFetchFailed()
            }
        }
    }
}
