//
//  IndicatableView.swift
//  Weatherman
//
//  Created by Subodh Jena on 17/05/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import UIKit
import APESuperHUD

extension IndicatableViewProtocol where Self: UIViewController {
    
    func showActivityIndicator() {
        APESuperHUD.showOrUpdateHUD(LoadingIndicatorType.standard, message: "", presentingView: self.view)
    }
    
    func hideActivityIndicator() {
        APESuperHUD.removeHUD(true, presentingView: self.view, completion: nil)
    }
}
