//
//  RecipesCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import UIKit

final class RecipesCoordinator: BaseCoordinator {
    typealias VoidClosure = () -> Void

    var finishFlow: VoidClosure?
    private let router: IRouter

    init(router: IRouter) {
        self.router = router
    }

    override func start() {
        let viewController = RecipesViewController()
        // we wont do this way
        // view controller wont know actually about navigation
        // view controller will only marry our view and model
        // so we will define special provider, i mean something like interactor in VIPER
        // and this special provider will decide what to do with view and navigation, receiving
        // events with Combine
        viewController.coordinator = self
        // now i use upper line just to test navigation by simpliest method (storing coordinator in VC)

        let recipesViewController = UINavigationController(rootViewController: viewController)
        router.addTabBarModule(recipesViewController)
    }

    func showFullInfoRecipeScreen() {
        print("[🐞 DEBUG] Now in \(#function)")
//        let viewController = CoolVC()
//        router.push(viewController)
        finishFlow?()
    }

}
