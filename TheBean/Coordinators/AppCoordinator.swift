//
//  AppCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

final class AppCoordinator: ICoordinator {
    var childCoordinators: [ICoordinator]

    var navigationController: UINavigationController

    var parentCoordinator: ICoordinator?

    init(_ navigationController: UINavigationController) {
        self.parentCoordinator = nil
        self.navigationController = navigationController
        childCoordinators = []
    }

    func start() {
        let tabBarCoordinator = TabBarCoordinator(UINavigationController(), parentCoordinator: self)
        childCoordinators.append(tabBarCoordinator)
        tabBarCoordinator.start()
    }

}
