//
//  HomeViewController.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var weatherData : WeatherData!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        APIManager.sharedInstance.getWeatherByCityName(cityName: "Delhi") { (result) in
            do {
                let data = try result.unwrap()
                self.weatherData = data
            }
            catch let error as NSError {
                debugPrint("Get user error: \(error.localizedDescription)")
            }
        }
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
