//
//  RecipesCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import class UIKit.UINavigationController
import Utils

final class RecipesCoordinator: ICoordinator {
    // MARK: - Properties
    var childCoordinators: [ICoordinator] = []

    var finishFlow: VoidClosure?
    private let router: IRouter

    // MARK: - Initialization
    init(router: IRouter) {
        self.router = router
    }

    // MARK: - Public methods
    func start() {
        let viewController = RecipesViewController()
        viewController.coordinator = self

        let recipesViewController = UINavigationController(rootViewController: viewController)
        router.addTabBarModule(recipesViewController)
    }

    func showFullInfoRecipeScreen() {
        print("[🐞 DEBUG] Now in \(#function)")
        finishFlow?()
    }

}
