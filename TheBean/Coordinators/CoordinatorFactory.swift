//
//  CoordinatorFactory.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import Foundation

protocol ICoordinatorFactory {

    func makeApplicationCoordinator(router: IRouter) -> ApplicationCoordinator

    func makeTabBarCoordinator(router: IRouter) -> TabBarCoordinator

    func makeTestsCoordinator(router: IRouter) -> TestsCoordinator

    func makeRecipesCoordinator(router: IRouter) -> RecipesCoordinator

    func makeStatisticsCoordinator(router: IRouter) -> StatisticsCoordinator

    func makeTimerCoordinator(router: IRouter) -> TimerCoordinator

    func makeAccountCoordinator(router: IRouter) -> AccountCoordinator
}

final class CoordinatorFactory: ICoordinatorFactory {
    func makeApplicationCoordinator(router: IRouter) -> ApplicationCoordinator {
        return ApplicationCoordinator(router: router, coordinatorFactory: self)
    }

    func makeTabBarCoordinator(router: IRouter) -> TabBarCoordinator {
        return TabBarCoordinator(router: router, coordinatorFactory: self)
    }

    func makeTestsCoordinator(router: IRouter) -> TestsCoordinator {
        return TestsCoordinator(router: router)
    }

    func makeRecipesCoordinator(router: IRouter) -> RecipesCoordinator {
        return RecipesCoordinator(router: router)
    }

    func makeStatisticsCoordinator(router: IRouter) -> StatisticsCoordinator {
        return StatisticsCoordinator(router: router)
    }

    func makeTimerCoordinator(router: IRouter) -> TimerCoordinator {
        return TimerCoordinator(router: router)
    }

    func makeAccountCoordinator(router: IRouter) -> AccountCoordinator {
        return AccountCoordinator(router: router)
    }

}
