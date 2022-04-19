//
//  TestCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol TestFlowProtocol: AnyObject {

}

final class TestCoordinator: CoordinatorProtocol, TestFlowProtocol {

    weak var navigationController: UINavigationController?

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let testViewController = TestVC()
        testViewController.coordinator = self
        navigationController?.pushViewController(testViewController, animated: false)
    }

}
