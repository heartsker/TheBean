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
        // MARK: Test
        let testVC = TestVC()
        let testNVC = UINavigationController(rootViewController: testVC)
        testVC.setupTabBar("Test", image: "wrench.and.screwdriver")
        
        tabBar.tintColor = .materialHeavy
        tabBar.unselectedItemTintColor = .materialMedium
        tabBar.backgroundColor = .hightlightSecondary
        
        // MARK: Add Navigation Controllers to the main TabBar here:
        viewControllers = [testNVC, recipesNVC, statisticsNVC, timerNVC]
    }
}
