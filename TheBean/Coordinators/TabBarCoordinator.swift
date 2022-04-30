//
//  TabBarCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 28.04.2022.
//

import UIKit

final class TabBarCoordinator: BaseCoordinator {
    typealias VoidClosure = () -> Void

    var finishFlow: VoidClosure?

    private let router: IRouter
    private let coordinatorFactory: ICoordinatorFactory
    
    private var tabBarController = UITabBarController()

    init(router: IRouter, coordinatorFactory: ICoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {

        router.setRootModule(tabBarController)
    }

    private func runTestsFlow() {
        let coordinator = coordinatorFactory.makeTestsCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChildCoordinator(coordinator)
        }
        self.addChildCoordinator(coordinator)
        coordinator.start()
    }

}

//
//
// final class TabBarCoordinator: ICoordinator {
//    var childCoordinators: [ICoordinator]
//
//    var navigationController: UINavigationController
//
//    var parentCoordinator: ICoordinator?
//
//    let tabBarController = UITabBarController()
//
//    init(_ navigationController: UINavigationController, parentCoordinator: ICoordinator) {
//        self.navigationController = navigationController
//        self.parentCoordinator = parentCoordinator
//        childCoordinators = []
//    }
//
//    func start() {
//        childCoordinators = configureChildCoordinators()
//        startChildCoordinators()
//        setupTabBarAppearance()
//    }
//
//    private func configureChildCoordinators() -> [ICoordinator] {
//        let testNavController = UINavigationController()
//        let testCoordinator = TestCoordinator(testNavController, parentCoordinator: self)
//
//        let recipesNavController = UINavigationController()
//        let recipesCoordinator = RecipesCoordinator(recipesNavController, parentCoordinator: self)
//
//        let statiscticsNavController = UINavigationController()
//        let statisticsCoordinator = StatisticsCoordinator(statiscticsNavController, parentCoordinator: self)
//
//        let timerNavController = UINavigationController()
//        let timerCoordinator = TimerCoordinator(timerNavController, parentCoordinator: self)
//
//        let accountNavController = UINavigationController()
//        let accountCoordinator = AccountCoordinator(accountNavController, parentCoordinator: self)
//
//        tabBarController.setViewControllers([testNavController,
//                                             recipesNavController,
//                                             statiscticsNavController,
//                                             timerNavController,
//                                             accountNavController],
//                                            animated: false)
//
//        return [testCoordinator, recipesCoordinator, statisticsCoordinator, timerCoordinator, accountCoordinator]
//    }
//
//    private func startChildCoordinators() {
//        childCoordinators.forEach {
//            $0.start()
//        }
//    }
//
//    private func setupTabBarAppearance() {
//        let tabBar = tabBarController.tabBar
//        tabBar.tintColor = .materialHeavy
//        tabBar.unselectedItemTintColor = .materialMedium
//        tabBar.backgroundColor = .hightlightSecondary
//    }
//
// }
