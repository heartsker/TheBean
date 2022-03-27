//
//  StatsLocalization.swift
//  TheBean
//
//  Created by Daniel Pustotin on 27.03.2022.
//

import Foundation

class StatsLocalization: ILocalizable {
     static let table: String = "Statistics"

     static let personalRecomendations = StatsLocalization.localize("personal.recomendations")

     static let globalStatistics = StatsLocalization.localize("global.statistics")
     static let mostPopularDrinkSuffix = StatsLocalization.localize("most.popular.drink.suffix")
     static let averageCupsPerDay = StatsLocalization.localize("average.cups.per.day")
 }
