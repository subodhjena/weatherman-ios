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
    var weatherData : WeatherData!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func showWeatherData(weatherData: WeatherData) {
        
        self.weatherData = weatherData
    }
}
