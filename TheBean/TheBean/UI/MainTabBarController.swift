//
//  MainTabBarController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        
        setupTabBar()
    }
    
    private func setupTabBar() {
        let recipesVC = RecipesViewController()
        let timerVC = TimerViewController()
        let statisticsVC = StatisticsViewController()
        
        let recipesNVC = UINavigationController(rootViewController: recipesVC)
        let statisticsNVC = UINavigationController(rootViewController: statisticsVC)
        let timerNVC = UINavigationController(rootViewController: timerVC)
        
        recipesVC.title = "Recipes"
        statisticsVC.title = "Statistics"
        timerVC.title = "Timer"
        
        recipesVC.tabBarItem.image = UIImage(systemName: "book")
        timerVC.tabBarItem.image = UIImage(systemName: "timer")
        statisticsVC.tabBarItem.image = UIImage(systemName: "doc")
        
        // MARK: Add Navigation Controllers to the main TabBar here:
        
        viewControllers = [recipesNVC, statisticsNVC, timerNVC]
    }
    
    
}
