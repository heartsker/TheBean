//
//  ICoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 28.04.2022.
//

import UIKit

protocol ICoordinator: AnyObject {
    func start()
}

class BaseCoordinator: ICoordinator {

    var childCoordinators: [ICoordinator] = []

    func start() {

    }

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
