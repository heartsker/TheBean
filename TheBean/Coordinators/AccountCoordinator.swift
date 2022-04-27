//
//  AccountCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol AccountFlowProtocol: AnyObject {

}

final class AccountCoordinator: ICoordinator, AccountFlowProtocol {
    var parentCoordinator: ICoordinator?

    var childCoordinators: [ICoordinator]

    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController, parentCoordinator: ICoordinator) {
        self.navigationController = navigationController
        childCoordinators = []
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let accountViewController = AccountViewController()
        accountViewController.coordinator = self
        navigationController.pushViewController(accountViewController, animated: false)
    }

}
