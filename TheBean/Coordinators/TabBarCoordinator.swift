//
//  TabBarCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import Foundation
import UIKit

final class TabBarCoordinator: CoordinatorProtocol {

    let tabBarController = UITabBarController()
    let window: UIWindow

    init(in window: UIWindow) {
        self.window = window
    }

    func start() {
        let testNavController = UINavigationController()
        let testCoordinator = TestCoordinator(testNavController)

        let recipesNavController = UINavigationController()
        let recipesCoordinator = RecipesCoordinator(recipesNavController)

        let statiscticsNavController = UINavigationController()
        let statisticsCoordinator = StatisticsCoordinator(statiscticsNavController)

        let timerNavController = UINavigationController()
        let timerCoordinator = TimerCoordinator(timerNavController)

        let accountNavController = UINavigationController()
        let accountCoordinator = AccountCoordinator(accountNavController)

        coordinate(to: testCoordinator)
        coordinate(to: recipesCoordinator)
        coordinate(to: statisticsCoordinator)
        coordinate(to: timerCoordinator)
        coordinate(to: accountCoordinator)

        tabBarController.setViewControllers([testNavController,
                                             recipesNavController,
                                             statiscticsNavController,
                                             timerNavController,
                                             accountNavController],
                                            animated: false)
        setupTabBarAppearance()
        window.rootViewController = tabBarController

    }

    private func setupTabBarAppearance() {
        let tabBar = tabBarController.tabBar
        tabBar.tintColor = .materialHeavy
        tabBar.unselectedItemTintColor = .materialMedium
        tabBar.backgroundColor = .hightlightSecondary
    }

    private func setupTabBarItems() {

    }

}
