//
//  RecipesCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol RecipesFlowProtocol: AnyObject {

}

final class RecipesCoordinator: ICoordinator, RecipesFlowProtocol {
    var parentCoordinator: ICoordinator?

    var childCoordinators: [ICoordinator]

    var navigationController: UINavigationController

    init(_ navigationController: UINavigationController, parentCoordinator: ICoordinator) {
        self.navigationController = navigationController
        childCoordinators = []
        self.parentCoordinator = parentCoordinator
    }

    func start() {
        let recipesViewController  = RecipesViewController()
        recipesViewController.coordinator = self
        navigationController.pushViewController(recipesViewController, animated: false)
    }

    func showAdditionalInfo() {
        print("🐞 [RecipesCoordinator] \(#function)")
    }

}
