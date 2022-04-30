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

protocol IRouter: IPresentable {

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

  func setRootModule(_ module: IPresentable?)
  func setRootModule(_ module: IPresentable?, hideBar: Bool)

  func popToRootModule(animated: Bool)
}

final class Router: IRouter {

  private weak var rootController: UINavigationController?
  private var completions: [UIViewController : () -> Void]

  init(rootController: UINavigationController) {
    self.rootController = rootController
    completions = [:]
  }

  func toPresent() -> UIViewController? {
    return rootController
  }

  func present(_ module: IPresentable?) {
    present(module, animated: true)
  }

  func present(_ module: IPresentable?, animated: Bool) {
    guard let controller = module?.toPresent() else { return }
    rootController?.present(controller, animated: animated, completion: nil)
  }

  func dismissModule() {
    dismissModule(animated: true, completion: nil)
  }

  func dismissModule(animated: Bool, completion: (() -> Void)?) {
    rootController?.dismiss(animated: animated, completion: completion)
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
    rootController?.pushViewController(controller, animated: animated)
  }

  func popModule() {
    popModule(animated: true)
  }

  func popModule(animated: Bool) {
    if let controller = rootController?.popViewController(animated: animated) {
      runCompletion(for: controller)
    }
  }

  func setRootModule(_ module: IPresentable?) {
    setRootModule(module, hideBar: false)
  }

  func setRootModule(_ module: IPresentable?, hideBar: Bool) {
    guard let controller = module?.toPresent() else { return }
    rootController?.setViewControllers([controller], animated: false)
    rootController?.isNavigationBarHidden = hideBar
  }

  func popToRootModule(animated: Bool) {
    if let controllers = rootController?.popToRootViewController(animated: animated) {
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
