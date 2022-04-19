//
//  RecipesCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 19.04.2022.
//

import UIKit

protocol RecipesFlowProtocol: AnyObject {

}

final class RecipesCoordinator: CoordinatorProtocol, RecipesFlowProtocol {

    weak var navigationController: UINavigationController?

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let recipesViewController  = RecipesViewController()
        recipesViewController.coordinator = self
        navigationController?.pushViewController(recipesViewController, animated: false)
    }

    func showAdditionalInfo() {
        print("🐞 [RecipesCoordinator] \(#function)")
    }

}
