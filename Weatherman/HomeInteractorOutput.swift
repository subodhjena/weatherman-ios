//
//  HomeInteractorOutput.swift
//  Weatherman
//
//  Created by Subodh Jena on 17/05/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation

protocol HomeInteractorOutput: class {
    
    func weatherDataFetched(weatherData: WeatherData)
    func weatherDataFetchFailed(message: String)
    
    func forecastDataFetched(forecastData: ForecastData)
    func forecastDataFetchFailed(message: String)
}
