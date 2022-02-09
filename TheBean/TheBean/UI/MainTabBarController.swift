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
        
        apiModel.getRecipesList()
        // MARK: Add Navigation Controllers to the main TabBar here:
        
        viewControllers = [navRecipesVC, navTimerVC]
    }
    
    
}
