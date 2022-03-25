//
//  MainTabBarController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import UIKit

class MainTabBarController: UITabBarController, IBaseView {
    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

    // MARK: - Subviews
    func setupSubviews() {
        let recipesVC = RecipesViewController()
        let timerVC = TimerViewController()
        let statisticsVC = StatisticsViewController()

        let recipesNVC = UINavigationController(rootViewController: recipesVC)
        let statisticsNVC = UINavigationController(rootViewController: statisticsVC)
        let timerNVC = UINavigationController(rootViewController: timerVC)

        recipesVC.setupTabBar(^ControllerLocalization.recipes, image: "book")
        statisticsVC.setupTabBar(^ControllerLocalization.statistics, image: "chart.bar.xaxis")
        timerVC.setupTabBar(^ControllerLocalization.timer, image: "timer")
        // MARK: Test
        let testVC = TestVC()
        let testNVC = UINavigationController(rootViewController: testVC)
        testVC.setupTabBar(^ControllerLocalization.test, image: "wrench.and.screwdriver")

        tabBar.tintColor = .materialHeavy
        tabBar.unselectedItemTintColor = .materialMedium
        tabBar.backgroundColor = .hightlightSecondary

        // MARK: Add Navigation Controllers to the main TabBar here:
        viewControllers = [testNVC, recipesNVC, statisticsNVC, timerNVC]
    }

    func setupConstraints() {}
}
