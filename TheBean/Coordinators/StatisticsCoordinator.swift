//
//  StatisticsCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol StatisticsFlowProtocol: AnyObject {

}

final class StatisticsCoordinator: CoordinatorProtocol, StatisticsFlowProtocol {

    weak var navigationController: UINavigationController?

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let statisticsViewController = StatisticsViewController()
        statisticsViewController.coordinator = self
        navigationController?.pushViewController(statisticsViewController, animated: false)
    }

}
