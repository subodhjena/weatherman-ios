//
//  HomeViewController.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var presenter: HomePresentationProtocol!
    var searchActive : Bool = false
    var forecastData : ForecastData! {
        didSet{
            self.tableForecast.reloadData()
        }
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelTempreature: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var tableForecast: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.resetUI()
        self.tableForecast.dataSource = self
        
        presenter.getWeatherForCity(cityName: "Delhi")
        presenter.getForecastForCity(cityName: "Delhi")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func resetUI() {
        
        self.labelCityName.text = ""
        self.labelTempreature.text = ""
        self.labelDescription.text = ""
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func displayWeatherData(weatherData: WeatherData) {
        
        self.labelCityName.text = weatherData.name
        
        if(weatherData.main != nil) {
            self.labelTempreature.text = presenter.tempreatureInCelcius(kelvin: (weatherData.main?.temp)!)
            self.labelDescription.text = "Pressure: \((weatherData.main?.pressure)!) | Humidity: \((weatherData.main?.humidity)!) | Max: \(presenter.tempreatureInCelcius(kelvin: (weatherData.main?.temp_min)!)) | Min: \(presenter.tempreatureInCelcius(kelvin: (weatherData.main?.temp_min)!))"
        }
    }
    
    func displayForecastData(forecastData: ForecastData) {
        self.forecastData = forecastData
    }
}

extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(forecastData != nil) {
            return (self.forecastData.list?.count)!
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastCell") as! ForecastTableViewCell
        cell.presenter = self.presenter
        let forecast = self.forecastData.list?[indexPath.row]
        
        cell.setUpCell(forecast: forecast!)
        
        return cell
    }
}
