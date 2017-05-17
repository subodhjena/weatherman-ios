//
//  RootRouter.swift
//  Weatherman
//
//  Created by Subodh Jena on 5/17/17.
//  Copyright © 2017 Subodh Jena. All rights reserved.
//

import Foundation
import UIKit

class RootRouter: RootProtocol {
    
    func presentTasksScreen(in window: UIWindow) {
       
        window.makeKeyAndVisible()
        window.rootViewController = TasksRouter.assembleModule()
    }
}
