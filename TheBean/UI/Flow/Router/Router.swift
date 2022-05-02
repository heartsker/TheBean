//
//  Router.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import UIKit
import Utils

/// IRouter implementation
final class Router {
    // MARK: - Properties
    /// Tab bar controller
    private(set) weak var tabBarController: UITabBarController?

    /// Current navigation controller
    private var currentNavigationController: UINavigationController? {
        (tabBarController?.viewControllers?[tabBarController?.selectedIndex ?? 0] as? UINavigationController)
    }

    /// Completions for controllers
    private var completions: [UIViewController: VoidClosure]

    // MARK: - Initialization
    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        self.completions = [:]
    }
}

extension Router: IRouter {
    // MARK: - Properties
    var presenting: UIViewController? {
        currentNavigationController
    }

    // MARK: - Public methods
    func addTabBarModule(_ module: IPresentable?) {
        guard let controller = module?.presenting else {
            return
        }
        let currentViewControllers: [UIViewController] = tabBarController?.viewControllers ?? []
        tabBarController?.setViewControllers(currentViewControllers + [controller], animated: false)
    }

    func present(_ module: IPresentable?, animated: Bool = true) {
        guard let controller = module?.presenting else { return }
        currentNavigationController?.present(controller, animated: animated, completion: nil)
    }

    func dismissModule(animated: Bool = true, completion: VoidClosure? = nil) {
        currentNavigationController?.dismiss(animated: animated, completion: completion)
    }

    func push(_ module: IPresentable?,
              animated: Bool = true,
              hideBottomBar: Bool = false,
              completion: VoidClosure? = nil) {
        guard let controller = module?.presenting, (controller is UINavigationController == false) else {
            assertionFailure("Deprecated push UINavigationController.")
            return
        }

        if let completion = completion {
            completions[controller] = completion
        }
        controller.hidesBottomBarWhenPushed = hideBottomBar
        currentNavigationController?.pushViewController(controller, animated: animated)
    }

    func popModule(animated: Bool = true) {
        if let controller = currentNavigationController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func setNavigationControllerRootModule(_ module: IPresentable?, hideBar: Bool = false) {
        guard let controller = module?.presenting else { return }
        currentNavigationController?.setViewControllers([controller], animated: false)
        currentNavigationController?.isNavigationBarHidden = hideBar
    }

    func popToRootModule(animated: Bool = true) {
        if let controllers = currentNavigationController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }

    // MARK: - Private methods
    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }
}
