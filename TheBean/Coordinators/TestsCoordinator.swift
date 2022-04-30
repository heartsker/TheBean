//
//  TestsCoordinator.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import Foundation

final class TestsCoordinator: BaseCoordinator {
    typealias VoidClosure = () -> Void

    var finishFlow: VoidClosure?
    private let router: IRouter

    init(router: IRouter) {
        self.router = router
    }

    override func start() {
        let testsViewController = TestVC()
        router.setRootModule(testsViewController)
    }
}
