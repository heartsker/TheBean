//
//  AccountCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import class UIKit.UINavigationController
import Utils

final class AccountCoordinator: ICoordinator {
    // MARK: - Properties
    var childCoordinators: [ICoordinator] = []

    var finishFlow: VoidClosure?
    var onSignOut: VoidClosure?

    private let router: IRouter

    // MARK: - Initialization
    init(router: IRouter) {
        self.router = router
    }

    // MARK: - Public methods
    func start() {
        let accountViewController = UINavigationController(rootViewController: AccountViewController())
        router.addTabBarModule(accountViewController)
    }
}
