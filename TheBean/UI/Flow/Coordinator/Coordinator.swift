//
//  ICoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 28.04.2022.
//

import UIKit
import Utils

/// Extends each coordinator class which conforms to this protocol with functionality of starting
/// This is the main and logically most needed func which is required from coordinator classes
protocol ICoordinator: AnyObject {
    // MARK: - Properties
    var childCoordinators: [ICoordinator] { get set }

    // MARK: - Methods
    func start()
    var finishFlow: VoidClosure? { get set }
}

/// Extends `ICoordinator` with default implementations
extension ICoordinator {
    // MARK: - Methods
    func addChild(coordinator: ICoordinator) {
        guard !childCoordinators.contains(where: { $0 === coordinator }) else { return }
        childCoordinators.append(coordinator)
    }

    func removeChild(coordinator: ICoordinator?) {
        guard
          childCoordinators.isEmpty == false,
          let coordinator = coordinator
          else { return }

        if !coordinator.childCoordinators.isEmpty {
            coordinator.childCoordinators
                .filter({ $0 !== coordinator })
                .forEach({ coordinator.removeChild(coordinator: $0) })
        }
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
