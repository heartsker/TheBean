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
        setupTabBar()
    }
    
    private func setupTabBar() {
        let recipesVC = RecipesViewController()
        let timerVC = TimerViewController()
        
        let navRecipesVC = UINavigationController(rootViewController: recipesVC)
        let navTimerVC = UINavigationController(rootViewController: timerVC)
        
        recipesVC.title = "Recipes"
        timerVC.title = "Timer"
        
        recipesVC.tabBarItem.image = UIImage(systemName: "book")
        timerVC.tabBarItem.image = UIImage(systemName: "timer")
        
        viewControllers = [navRecipesVC, navTimerVC]
    }
    
    
}
