//
//  MainTabBarController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 28.01.2022.
//

import Localize
import Utils
import AssetsManager

class MainTabBarController: UITabBarController {

    // MARK: - Initialization
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: - Setup methods
extension MainTabBarController {
    private func setup() {
        setupSubviews()
    }

    private func setupSubviews() {
        let recipesVC = RecipesViewController()
        let statisticsVC = StatisticsViewController()
        let timerVC = TimerViewController()
        let accountVC = AccountViewController()

        let recipesNVC = UINavigationController(rootViewController: recipesVC)
        let statisticsNVC = UINavigationController(rootViewController: statisticsVC)
        let timerNVC = UINavigationController(rootViewController: timerVC)
        let accountNVC = UINavigationController(rootViewController: accountVC)

        recipesVC.setupTabBar(^ControllerLocalization.recipes, image: "book")
        statisticsVC.setupTabBar(^ControllerLocalization.statistics, image: "chart.bar.xaxis")
        timerVC.setupTabBar(^ControllerLocalization.timer, image: "timer")
        accountVC.setupTabBar(^ControllerLocalization.account, image: "person")

        // MARK: - Test
        let testVC = TestViewController()
        let testNVC = UINavigationController(rootViewController: testVC)
        testVC.setupTabBar(^ControllerLocalization.test, image: "wrench.and.screwdriver")

        tabBar.tintColor = Pallete.materialHeavy
        tabBar.unselectedItemTintColor = Pallete.materialMedium
        tabBar.backgroundColor = Pallete.hightlightSecondary

        viewControllers = [testNVC, recipesNVC, statisticsNVC, timerNVC, accountNVC]
    }
}
