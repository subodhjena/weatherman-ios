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
            view?.displayWeatherData(weatherData: weatherData)
        }
    }
    
    var forecastData: ForecastData! {
        didSet {
            view?.displayForecastData(forecastData: forecastData)
        }
    }
    
    func viewDidLoad() {
        
    }
    
    func getWeatherForCity(cityName: String) {
        
        interactor.fetchWeatherData(cityName: cityName)
        view?.showActivityIndicator()
    }
    
    func getForecastForCity(cityName: String) {
        interactor.fetchForecastData(cityName: cityName)
    }
    
    func tempreatureInCelcius(kelvin: Double) -> String {
        let celcius = Int(kelvin - 273.15)
        return "\(celcius)°C"
    }
    
    func tempreatureInFahrenheit(kelvin: Double) -> String {
        let farenheit = Int(9/5 * (kelvin - 273.15) + 32)
        return "\(farenheit)°F"
    }
}

extension HomePresenter : HomeInteractorOutput {
    
    func weatherDataFetched(weatherData: WeatherData) {
        self.weatherData = weatherData
        view?.hideActivityIndicator()
    }
    
    func weatherDataFetchFailed(message: String) {
        view?.hideActivityIndicator()
        view?.showMessage(title: "Failed", message: message)
    }
    
    func forecastDataFetched(forecastData: ForecastData) {
        self.forecastData = forecastData
    }
    
    func forecastDataFetchFailed(message: String) {
        view?.showMessage(title: "Cannot Fetch Forecast Data", message: message)
    }
}
