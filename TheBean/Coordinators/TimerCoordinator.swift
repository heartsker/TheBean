//
//  TimerCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol TimerFlowProtocol: AnyObject {

}

final class TimerCoordinator: ICoordinator, TimerFlowProtocol {
    var parentCoordinator: ICoordinator?

    var navigationController: UINavigationController

    var childCoordinators: [ICoordinator]

    init(_ navigationController: UINavigationController, parentCoordinator: ICoordinator) {
        self.navigationController = navigationController
        childCoordinators = []
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let timerViewController = TimerViewController()
        timerViewController.coordinator = self
        navigationController.pushViewController(timerViewController, animated: false)
    }

}
