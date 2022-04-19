//
//  TimerCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol TimerFlowProtocol: AnyObject {

}

final class TimerCoordinator: CoordinatorProtocol, TimerFlowProtocol {

    weak var navigationController: UINavigationController?

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let timerViewController = TimerViewController()
        timerViewController.coordinator = self
        navigationController?.pushViewController(timerViewController, animated: false)
    }

}
