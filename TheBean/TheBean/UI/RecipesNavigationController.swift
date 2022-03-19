//
//  RecipesNavigationController.swift
//  TheBean
//
//  Created by Daniel Pustotin on 31.01.2022.
//

import UIKit

class RecipesNavigationController: BeanNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBarItem.title = "Recipes"
        tabBarItem.image = UIImage(systemName: "book")

        setViewControllers([RecipesViewController()], animated: true)
    }
}
