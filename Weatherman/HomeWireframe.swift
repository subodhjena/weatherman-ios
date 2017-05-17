//
//  HomeWireframe.swift
//  Weatherman
//
//  Created by Subodh Jena on 17/05/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import UIKit

protocol HomeWireframe: class {
    
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
}
