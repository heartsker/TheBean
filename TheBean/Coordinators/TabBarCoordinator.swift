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
        runTabBarFlows()
        setupTabBarAppearance()
    }

    private func runTabBarFlows() {
        runTestsFlow()
        runRecipesFlow()
        runStatisticsFlow()
        runTimerFlow()
        runAccountFlow()
    }

    private func runTestsFlow() {
        let coordinator = coordinatorFactory.makeTestsCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChildCoordinator(coordinator)
        }
        self.addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func runRecipesFlow() {
        let coordinator = coordinatorFactory.makeRecipesCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChildCoordinator(coordinator)
        }
        self.addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func runStatisticsFlow() {
        let coordinator = coordinatorFactory.makeStatisticsCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChildCoordinator(coordinator)
        }
        self.addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func runTimerFlow() {
        let coordinator = coordinatorFactory.makeTimerCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChildCoordinator(coordinator)
        }
        self.addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func runAccountFlow() {
        let coordinator = coordinatorFactory.makeAccountCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChildCoordinator(coordinator)
        }
        self.addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func setupTabBarAppearance() {
        guard let tabBarController = (router as? Router)?.tabBarController else { return }
        let tabBar = tabBarController.tabBar
        tabBar.tintColor = .materialHeavy
        tabBar.unselectedItemTintColor = .materialMedium
        tabBar.backgroundColor = .hightlightSecondary
    }

}
