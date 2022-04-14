//
//  MainCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 14.04.2022.
//

import UIKit

final class MainCoordinator {

    enum Route {
        case recipes(RecipesRoute)
        case statistics(StatisticsRoute)
        case timer(TimerRoute)
        case account(AccountRoute)
    }

    private let tabBarController = UITabBarController()

    var currentNavigationController: UINavigationController {
        // swiftlint:disable:next force_cast
        tabBarController.viewControllers?[tabBarController.selectedIndex] as! UINavigationController
    }

    func start(in window: UIWindow) {
        setupTabBar()
        window.rootViewController = tabBarController
        MainStore.shared.coordinator = self
    }

}

extension MainCoordinator {

    func setupTabBar() {
        let controllers = [
            TestVC(),
            RecipesViewController(),
            StatisticsViewController(),
            TimerViewController(),
            AccountViewController()
        ].map { UINavigationController(rootViewController: $0) }
        tabBarController.setViewControllers(controllers, animated: true)
        setupTabBarAppearance()
    }

    func setupTabBarAppearance() {
        let tabBar = tabBarController.tabBar
        tabBar.tintColor = .materialHeavy
        tabBar.unselectedItemTintColor = .materialMedium
        tabBar.backgroundColor = .hightlightSecondary
    }

}

extension MainCoordinator {
    func proceed(to endpoint: Route) {
        var controller: UIViewController?
        var present = false

        switch endpoint {
        case .recipes(.exampleRoute1):
            controller = CoolVC()

        case .recipes(.exampleRoute2):
            controller = CoolVC()
            present = true
        default:
            controller = CoolVC()

        }

        if let controller = controller {
            if present {
                currentNavigationController.topViewController?.present(controller,
                                                                       animated: true,
                                                                       completion: nil)
            } else {
                currentNavigationController.pushViewController(controller, animated: true)
            }
        }
    }
}
