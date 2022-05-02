//
//  Presentable.swift
//  TheBean
//
//  Created by Daniel Pustotin on 02.05.2022.
//

import class UIKit.UIViewController
import Utils

protocol IPresentable: AnyObject {
    var presenting: UIViewController? { get }
}

extension UIViewController: IPresentable {
    var presenting: UIViewController? {
        self
    }
}

/// Defines an interface for simplifying working with navigation operations
protocol IRouter: IPresentable {
    func addTabBarModule(_ module: IPresentable?)

    func present(_ module: IPresentable?, animated: Bool)

    func push(_ module: IPresentable?, animated: Bool, hideBottomBar: Bool, completion: VoidClosure?)

    func popModule(animated: Bool)

    func dismissModule(animated: Bool, completion: VoidClosure?)

    func setNavigationControllerRootModule(_ module: IPresentable?, hideBar: Bool)

    func popToRootModule(animated: Bool)
}
