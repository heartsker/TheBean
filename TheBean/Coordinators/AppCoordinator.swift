//
//  AppCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

final class AppCoordinator: CoordinatorProtocol {
    let window: UIWindow

    init(_ window: UIWindow) {
        self.window = window
    }

    func start() {
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        let tabBarCoordinator = TabBarCoordinator(in: window)
        coordinate(to: tabBarCoordinator)
    }
}
