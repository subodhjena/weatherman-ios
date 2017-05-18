//
//  HomePresentationProtocol.swift
//  Weatherman
//
//  Created by Subodh Jena on 17/05/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation

protocol HomePresentationProtocol: class {
    
    weak var view: HomeViewProtocol? { get set }
    var interactor: HomeInteractorInput! { get set }
    var router: HomeWireframe! { get set }
    
    func viewDidLoad()
    func getWeatherForCity(cityName: String)
}
