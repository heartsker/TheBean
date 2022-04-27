//
//  TestCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol TestFlowProtocol: AnyObject {

}

final class TestCoordinator: ICoordinator, TestFlowProtocol {
    var parentCoordinator: ICoordinator?

    var childCoordinators: [ICoordinator]

    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController, parentCoordinator: ICoordinator) {
        self.navigationController = navigationController
        childCoordinators = []
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let testViewController = TestVC()
        testViewController.coordinator = self
        navigationController.pushViewController(testViewController, animated: false)
    }

}
