//
//  Router.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import UIKit

protocol IPresentable: AnyObject {
    func toPresent() -> UIViewController?
}

extension UIViewController: IPresentable {

    func toPresent() -> UIViewController? {
        return self
    }
}

/// Defines an interface for simplifying working with navigation operations
protocol IRouter: IPresentable {

    func addTabBarModule(_ module: IPresentable?)

    func present(_ module: IPresentable?)
    func present(_ module: IPresentable?, animated: Bool)

    func push(_ module: IPresentable?)
    func push(_ module: IPresentable?, hideBottomBar: Bool)
    func push(_ module: IPresentable?, animated: Bool)
    func push(_ module: IPresentable?, animated: Bool, completion: (() -> Void)?)
    func push(_ module: IPresentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?)

    func popModule()
    func popModule(animated: Bool)

    func dismissModule()
    func dismissModule(animated: Bool, completion: (() -> Void)?)

    func setNavigationControllerRootModule(_ module: IPresentable?)
    func setNavigationControllerRootModule(_ module: IPresentable?, hideBar: Bool)

    func popToRootModule(animated: Bool)
}

/// IRouter implementation
final class Router {

    // is configured after starting all flows in TabBarCoordinator with using `addTabBarModule` function
    private(set) weak var tabBarController: UITabBarController?

    // this property is used in methods to work with navigation like push, pop etc.
    private var currentNavigationController: UINavigationController? {
        (tabBarController?.viewControllers?[tabBarController?.selectedIndex ?? 0] as? UINavigationController)
    }

    // for future usage
    // like animations and sending, receiving events
    private var completions: [UIViewController : () -> Void]

    init(tabBarController: UITabBarController) {
        self.tabBarController = tabBarController
        self.completions = [:]
    }

}

extension Router: IRouter {

    func addTabBarModule(_ module: IPresentable?) {
        guard let controller = module?.toPresent() else {
            return
        }

        let currentViewControllers: [UIViewController] = tabBarController?.viewControllers ?? []
        tabBarController?.setViewControllers(currentViewControllers + [controller], animated: false)
    }

    func toPresent() -> UIViewController? {
        return currentNavigationController
    }

    func present(_ module: IPresentable?) {
        present(module, animated: true)
    }

    func present(_ module: IPresentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        currentNavigationController?.present(controller, animated: animated, completion: nil)
    }

    func dismissModule() {
        dismissModule(animated: true, completion: nil)
    }

    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        currentNavigationController?.dismiss(animated: animated, completion: completion)
    }

    func push(_ module: IPresentable?) {
        push(module, animated: true)
    }

    func push(_ module: IPresentable?, hideBottomBar: Bool) {
        push(module, animated: true, hideBottomBar: hideBottomBar, completion: nil)
    }

    func push(_ module: IPresentable?, animated: Bool) {
        push(module, animated: animated, completion: nil)
    }

    func push(_ module: IPresentable?, animated: Bool, completion: (() -> Void)?) {
        push(module, animated: animated, hideBottomBar: false, completion: completion)
    }

    func push(_ module: IPresentable?, animated: Bool, hideBottomBar: Bool, completion: (() -> Void)?) {
        guard
            let controller = module?.toPresent(),
            (controller is UINavigationController == false)
        else { assertionFailure("Deprecated push UINavigationController."); return }

        if let completion = completion {
            completions[controller] = completion
        }
        controller.hidesBottomBarWhenPushed = hideBottomBar
        currentNavigationController?.pushViewController(controller, animated: animated)
    }

    func popModule() {
        popModule(animated: true)
    }

    func popModule(animated: Bool) {
        if let controller = currentNavigationController?.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    func setNavigationControllerRootModule(_ module: IPresentable?) {
        setNavigationControllerRootModule(module, hideBar: false)
    }

    func setNavigationControllerRootModule(_ module: IPresentable?, hideBar: Bool) {
        guard let controller = module?.toPresent() else { return }
        currentNavigationController?.setViewControllers([controller], animated: false)
        currentNavigationController?.isNavigationBarHidden = hideBar
    }

    func popToRootModule(animated: Bool) {
        if let controllers = currentNavigationController?.popToRootViewController(animated: animated) {
            controllers.forEach { controller in
                runCompletion(for: controller)
            }
        }
    }

    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }

}
