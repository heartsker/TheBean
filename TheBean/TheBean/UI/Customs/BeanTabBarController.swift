//
//  BeanTabBarController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import UIKit

class BeanTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .brown
        tabBar.unselectedItemTintColor = .black
    }
}
