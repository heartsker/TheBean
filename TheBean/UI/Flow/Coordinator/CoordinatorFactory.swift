//
//  CoordinatorFactory.swift
//  TheBean
//
//  Created by Ilya Buldin on 30.04.2022.
//

import Foundation

/// Defines interface for coordinator factory
/// Implementation of this protocol provide an interface objects without specifying their concrete classes
protocol ICoordinatorFactory {
    func makeApplicationCoordinator(router: IRouter) -> ApplicationCoordinator

    func makeTabBarCoordinator(router: IRouter) -> TabBarCoordinator

    func makeTestCoordinator(router: IRouter) -> TestCoordinator

    func makeRecipesCoordinator(router: IRouter) -> RecipesCoordinator

    func makeStatisticsCoordinator(router: IRouter) -> StatisticsCoordinator

    func makeTimerCoordinator(router: IRouter) -> TimerCoordinator

    func makeAccountCoordinator(router: IRouter) -> AccountCoordinator
}

/// ICoordinatorFactory implementations
final class CoordinatorFactory: ICoordinatorFactory {
    func makeApplicationCoordinator(router: IRouter) -> ApplicationCoordinator {
        ApplicationCoordinator(router: router, coordinatorFactory: self)
    }

    func makeTabBarCoordinator(router: IRouter) -> TabBarCoordinator {
        TabBarCoordinator(router: router, coordinatorFactory: self)
    }

    func makeTestCoordinator(router: IRouter) -> TestCoordinator {
        TestCoordinator(router: router)
    }

    func makeRecipesCoordinator(router: IRouter) -> RecipesCoordinator {
        RecipesCoordinator(router: router)
    }

    func makeStatisticsCoordinator(router: IRouter) -> StatisticsCoordinator {
        StatisticsCoordinator(router: router)
    }

    func makeTimerCoordinator(router: IRouter) -> TimerCoordinator {
        TimerCoordinator(router: router)
    }

    func makeAccountCoordinator(router: IRouter) -> AccountCoordinator {
        AccountCoordinator(router: router)
    }

}
