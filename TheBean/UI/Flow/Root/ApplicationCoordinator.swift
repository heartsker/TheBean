//
//  ApplicationCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import Utils

/// ApplicationCoordinator - instance of this class is stored in SceneDelegate
/// Provides logic for choosing which flow should be started
/// That is why you have to define `finishFlow` callback
final class ApplicationCoordinator: ICoordinator {
    // MARK: - Properties
    var childCoordinators: [ICoordinator] = []

    var finishFlow: VoidClosure?

    private let coordinatorFactory: ICoordinatorFactory
    private let router: IRouter

    private var isFirstLaunch = false
    private var isSignedIn = true

    // MARK: - Initialization
    init(router: IRouter, coordinatorFactory: ICoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    // MARK: - Public methods
    func start() {
        if isFirstLaunch {
            runStartFlow()
            isFirstLaunch = false
            return
        }

        if isSignedIn {
            runMainFlow()
        } else {
            runSignUpFlow()
        }
    }

    // MARK: - Private methods
    private func runStartFlow() {}

    private func runMainFlow() {
        let coordinator = coordinatorFactory.makeTabBarCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.start()
            self?.removeChild(coordinator: coordinator)
        }
        self.addChild(coordinator: coordinator)
        coordinator.start()
    }

    private func runSignUpFlow() {}
}
