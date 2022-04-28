//
//  MainCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 14.04.2022.
//

import AssetsManager

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
            TestViewController(),
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
        tabBar.tintColor = Pallete.materialHeavy
        tabBar.unselectedItemTintColor = Pallete.materialMedium
        tabBar.backgroundColor = Pallete.hightlightSecondary
    }

}

extension MainCoordinator {
    func proceed(to endpoint: Route) {
        var controllerVC: UIViewController?
        var present = false

        switch endpoint {
        case .recipes(.exampleRoute1):
            controllerVC = CoolViewController()

        case .recipes(.exampleRoute2):
            controllerVC = CoolViewController()
            present = true

        default:
            controllerVC = CoolViewController()

        }

        if let controller = controllerVC {
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
