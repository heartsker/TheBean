//
//  MainTabBarController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import UIKit

class MainTabBarController: BeanTabBarController {
    
    let apiModel = APIModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiModel.getRecipesList()
        // MARK: Add Navigation Controllers to the main TabBar here:
        
    }
    
    
}
