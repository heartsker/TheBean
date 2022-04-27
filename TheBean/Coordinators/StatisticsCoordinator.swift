//
//  StatisticsCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol StatisticsFlowProtocol: AnyObject {

}

final class StatisticsCoordinator: ICoordinator, StatisticsFlowProtocol {
    var parentCoordinator: ICoordinator?

    var childCoordinators: [ICoordinator]

    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController, parentCoordinator: ICoordinator) {
        self.navigationController = navigationController
        childCoordinators = []
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let statisticsViewController = StatisticsViewController()
        statisticsViewController.coordinator = self
        navigationController.pushViewController(statisticsViewController, animated: false)
    }

}
