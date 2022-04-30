//
//  TimerCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import UIKit

final class TimerCoordinator: BaseCoordinator {
    typealias VoidClosure = () -> ()

    var finishFlow: VoidClosure?
    private let router: IRouter

    init(router: IRouter) {
        self.router = router
    }

    override func start() {
        let timerViewController = UINavigationController(rootViewController: TimerViewController())
        router.addTabBarModule(timerViewController)
    }
}
