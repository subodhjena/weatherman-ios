//
//  HomeViewProtocol.swift
//  Weatherman
//
//  Created by Subodh Jena on 17/05/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation


protocol HomeViewProtocol: IndicatableViewProtocol {
    
    var presenter: HomePresentationProtocol! { get set }
    
    func showWeatherData(weatherData: WeatherData)
}
