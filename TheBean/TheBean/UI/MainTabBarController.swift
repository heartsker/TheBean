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
        
        recipesVC.setupTabBar("Recipes", image: "book")
        statisticsVC.setupTabBar("Statistics", image: "chart.bar.xaxis")
        timerVC.setupTabBar("Timer", image: "timer")
        
        tabBar.unselectedItemTintColor = .brown
        tabBar.tintColor = .black
        
        // MARK: Add Navigation Controllers to the main TabBar here:
        viewControllers = [recipesNVC, statisticsNVC, timerNVC]
    }
    
    
}
