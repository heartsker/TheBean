//
//  AccountCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol AccountFlowProtocol: AnyObject {

}

final class AccountCoordinator: CoordinatorProtocol, AccountFlowProtocol {

    weak var navigationController: UINavigationController?

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let accountViewController = AccountViewController()
        accountViewController.coordinator = self
        navigationController?.pushViewController(accountViewController, animated: false)
    }

}
