//
//  ApplicationCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import Foundation

final class ApplicationCoordinator: BaseCoordinator {

    private let coordinatorFactory: ICoordinatorFactory
    private let router: IRouter

    private var isFirstLaunch = false
    private var isSignedIn = true

    init(router: IRouter, coordinatorFactory: ICoordinatorFactory) {
        self.router = router
        self.coordinatorFactory = coordinatorFactory
    }

    override func start() {
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

    private func runStartFlow() {}

    private func runMainFlow() {
        let coordinator = coordinatorFactory.makeTabBarCoordinator(router: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            self?.start()
            self?.removeChildCoordinator(coordinator)
        }
        self.addChildCoordinator(coordinator)
        coordinator.start()
    }

    private func runSignUpFlow() {}

}
