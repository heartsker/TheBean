//
//  CoordinatorProtocol.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import Foundation
import UIKit

protocol ICoordinator: AnyObject {

    var childCoordinators: [ICoordinator] { get set }
    var navigationController: UINavigationController { get set }
    var parentCoordinator: ICoordinator? { get set }

    func start()
}

extension ICoordinator {
    func addChildCoordinator(_ childCoordinator: ICoordinator) {
        childCoordinators.append(childCoordinator)
    }

    func removeChildCoordinator(_ childCoordinator: ICoordinator) {
        childCoordinators = childCoordinators.filter { $0 !== childCoordinator }
    }
}
