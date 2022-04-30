//
//  ICoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 28.04.2022.
//

import UIKit

/// Extends each coordinator class which conforms to this protocol with functionality of starting
/// This is the main and logically most needed func which is required from coordinator classes
protocol ICoordinator: AnyObject {
    func start()
}

/// This is a base class which provides heirs control over child dependencies
class BaseCoordinator: ICoordinator {

    var childCoordinators: [ICoordinator] = []

    func start() {}

    func addChildCoordinator(_ coordinator: ICoordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }

    func removeChildCoordinator(_ coordinator: ICoordinator?) {
        guard
          childCoordinators.isEmpty == false,
          let coordinator = coordinator
          else { return }

        if let coordinator = coordinator as? BaseCoordinator, !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeChildCoordinator($0) })
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }

}
