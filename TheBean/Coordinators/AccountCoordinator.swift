//
//  AccountCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import UIKit

final class AccountCoordinator: BaseCoordinator {
    typealias VoidClosure = () -> ()

    var finishFlow: VoidClosure?
    var onSignOut: VoidClosure?

    private let router: IRouter

    init(router: IRouter) {
        self.router = router
    }

    override func start() {
        let accountViewController = UINavigationController(rootViewController: AccountViewController())
        router.addTabBarModule(accountViewController)
    }
}
