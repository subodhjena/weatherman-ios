//
//  HomePresenter.swift
//  Weatherman
//
//  Created by Subodh Jena on 17/05/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation

class HomePresenter : HomePresentationProtocol
{
    var view: HomeViewProtocol?
    var interactor: HomeInteractorInput!
    var router: HomeWireframe!
    
    var weatherData: WeatherData! {
        didSet {
            view?.showWeatherData(weatherData: weatherData)
        }
    }
    
    func viewDidLoad() {
        interactor.fetchWeatherData()
        view?.showActivityIndicator()
    }
}

extension HomePresenter : HomeInteractorOutput {
    
    func weatherDataFetched(weatherData: WeatherData) {
        self.weatherData = weatherData
        view?.hideActivityIndicator()
    }
    
    func weatherDataFetchFailed() {
        view?.hideActivityIndicator()
        view?.showMessage(title: "Failed", message: "Cannot get Weather Data, Try again.")
    }
}
