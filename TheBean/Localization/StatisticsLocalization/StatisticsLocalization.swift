//
//  StatisticsLocalization.swift
//  TheBean
//
//  Created by Daniel Pustotin on 25.03.2022.
//

import Foundation

class StatisticsLocalization: ILocalizable {
    static let table: String = "Statistics"

    static let personalRecomendations = StatisticsLocalization.localize("personal.recomendations")

    static let globalStatistics = StatisticsLocalization.localize("global.statistics")
    static let mostPopularDrinkSuffix = StatisticsLocalization.localize("most.popular.drink.suffix")
    static let averageCupsPerDay = StatisticsLocalization.localize("average.cups.per.day")
}
