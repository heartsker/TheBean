//
//  TabBarCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import Foundation
import UIKit

final class TabBarCoordinator: ICoordinator {
    var childCoordinators: [ICoordinator]

    var navigationController: UINavigationController

    var parentCoordinator: ICoordinator?

    let tabBarController = UITabBarController()

    init(_ navigationController: UINavigationController, parentCoordinator: ICoordinator) {
        self.navigationController = navigationController
        self.parentCoordinator = parentCoordinator
        childCoordinators = []
    }

    func start() {
        childCoordinators = configureChildCoordinators()
        startChildCoordinators()
        setupTabBarAppearance()
    }

    private func configureChildCoordinators() -> [ICoordinator] {
        let testNavController = UINavigationController()
        let testCoordinator = TestCoordinator(testNavController, parentCoordinator: self)

        let recipesNavController = UINavigationController()
        let recipesCoordinator = RecipesCoordinator(recipesNavController, parentCoordinator: self)

        let statiscticsNavController = UINavigationController()
        let statisticsCoordinator = StatisticsCoordinator(statiscticsNavController, parentCoordinator: self)

        let timerNavController = UINavigationController()
        let timerCoordinator = TimerCoordinator(timerNavController, parentCoordinator: self)

        let accountNavController = UINavigationController()
        let accountCoordinator = AccountCoordinator(accountNavController, parentCoordinator: self)

        tabBarController.setViewControllers([testNavController,
                                             recipesNavController,
                                             statiscticsNavController,
                                             timerNavController,
                                             accountNavController],
                                            animated: false)

        return [testCoordinator, recipesCoordinator, statisticsCoordinator, timerCoordinator, accountCoordinator]
    }

    private func startChildCoordinators() {
        childCoordinators.forEach {
            $0.start()
        }
    }

    private func setupTabBarAppearance() {
        let tabBar = tabBarController.tabBar
        tabBar.tintColor = .materialHeavy
        tabBar.unselectedItemTintColor = .materialMedium
        tabBar.backgroundColor = .hightlightSecondary
    }

}
