//
//  MainTabBarController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import Foundation
import UIKit

class MainTabBarController: BeanTabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Add Navigation Controllers to the main TabBar here:
        setViewControllers([
            RecipesNavigationController(),
            TimerNavigationController()
        ], animated: true)
    }
    
    
}
