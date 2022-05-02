//
//  TabBarCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 28.04.2022.
//

import class UIKit.UINavigationController
import Utils
import AssetsManager

final class TabBarCoordinator: ICoordinator {
    // MARK: - Properties
    var childCoordinators: [ICoordinator] = []

    var finishFlow: VoidClosure?

    private let router: IRouter
    private let coordinatorFactory: ICoordinatorFactory

    private var tabBarController = UITabBarController()

    // MARK: - Initialization
    init(router: IRouter, coordinatorFactory: ICoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    // MARK: - Public methods
    func start() {
        runTabBarFlows()
        setupTabBarAppearance()
    }

    // MARK: - Private methods
    private func runTabBarFlows() {
        runTestsFlow()
        runRecipesFlow()
        runStatisticsFlow()
        runTimerFlow()
        runAccountFlow()
    }

    private func runTestsFlow() {
        let coordinator = coordinatorFactory.makeTestCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChild(coordinator: coordinator)
        }
        addChild(coordinator: coordinator)
        coordinator.start()
    }

    private func runRecipesFlow() {
        let coordinator = coordinatorFactory.makeRecipesCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChild(coordinator: coordinator)
        }
        addChild(coordinator: coordinator)
        coordinator.start()
    }

    private func runStatisticsFlow() {
        let coordinator = coordinatorFactory.makeStatisticsCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChild(coordinator: coordinator)
        }
        addChild(coordinator: coordinator)
        coordinator.start()
    }

    private func runTimerFlow() {
        let coordinator = coordinatorFactory.makeTimerCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChild(coordinator: coordinator)
        }
        addChild(coordinator: coordinator)
        coordinator.start()
    }

    private func runAccountFlow() {
        let coordinator = coordinatorFactory.makeAccountCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.removeChild(coordinator: coordinator)
        }
        addChild(coordinator: coordinator)
        coordinator.start()
    }

    private func setupTabBarAppearance() {
        guard let tabBarController = (router as? Router)?.tabBarController else { return }
        let tabBar = tabBarController.tabBar
        tabBar.tintColor = Pallete.accentColor
        tabBar.unselectedItemTintColor = Pallete.materialMedium
        tabBar.backgroundColor = Pallete.hightlightSecondary
    }
}
