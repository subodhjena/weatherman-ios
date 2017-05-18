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
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var labelCityName: UILabel!
    @IBOutlet weak var labelTempreature: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.presenter.viewDidLoad()
        self.resetUI()
        self.createSearchBar()
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
    
    // MARK: - Search Bar
    
    private func createSearchBar() {
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = true
        searchBar.placeholder = "Enter City Name"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}

extension HomeViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        searchBar.text = ""
        searchBar.resignFirstResponder()
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
        
        presenter.getWeatherForCity(cityName: searchBar.text!)
        
        searchBar.text = ""
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: HomeViewProtocol {
    
    func displayWeatherData(weatherData: WeatherData) {
        
        self.labelCityName.text = weatherData.name
        
        if(weatherData.main != nil) {
            self.labelTempreature.text = "\(Int((weatherData.main?.temp)!))"
            self.labelDescription.text = "Pressure: \((weatherData.main?.pressure)!) | Humidity: \((weatherData.main?.humidity)!) | Max: \((weatherData.main?.temp_max)!) | Min: \((weatherData.main?.temp_min)!)"
        }
    }
}
