//
//  HomeRouter.swift
//  Weatherman
//
//  Created by Subodh Jena on 17/05/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import UIKit

class HomeRouter : NSObject, HomeWireframe {
    
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
    
        let presenter = HomePresenter()
        let interactor = HomeInteractor()
        let router = HomeRouter()
        
        let navigation = UINavigationController(rootViewController: view)
        
        view.presenter = presenter
        view.navigationItem.title = "Weatherman"
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigation
    }
}
