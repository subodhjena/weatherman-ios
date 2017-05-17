//
//  HomeInteractorInput.swift
//  Weatherman
//
//  Created by Subodh Jena on 17/05/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation

protocol HomeInteractorInput: class {
    
    weak var output: HomeInteractorOutput! { get set }
    
    func fetchWeatherData()
}
