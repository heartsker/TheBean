//
//  SceneDelegate.swift
//  TheBean
//
//  Created by Daniel Pustotin on 04.02.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    let coordinatorFactory = CoordinatorFactory()
    var applicationCoordinator: ICoordinator?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        runUI(scene: scene)
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }

    private func runUI(scene: UIScene) {
        guard let (window, coordinator) = configureKeyWindowWithCoordinator(with: scene) else { return }
        self.window = window
        self.applicationCoordinator = coordinator
        window.makeKeyAndVisible()
        coordinator.start()
    }

    private func configureKeyWindowWithCoordinator(with scene: UIScene) -> (UIWindow, ICoordinator)? {
        guard let windowScene = (scene as? UIWindowScene) else { return nil }
        let window = UIWindow(windowScene: windowScene)
        let rootViewController = UITabBarController()
        let router = Router(tabBarController: rootViewController)
        let coordinator = coordinatorFactory.makeApplicationCoordinator(router: router)
        window.rootViewController = rootViewController
        return (window, coordinator)
    }
}
