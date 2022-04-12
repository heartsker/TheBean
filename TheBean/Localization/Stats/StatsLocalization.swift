//
//  StatsLocalization.swift
//  TheBean
//
//  Created by Daniel Pustotin on 27.03.2022.
//

import Foundation

class StatsLocalization: ILocalizable {
    static let table: String = "Stats"

    static let scoreLabel = StatsLocalization.localize("score.label")
    static let scoreCupsDrunk = StatsLocalization.localize("score.cupsDrunk")
    static let scoreRecipesMastered = StatsLocalization.localize("score.recipesMastered")
    static let scoreHealthScore = StatsLocalization.localize("score.healthScore")

    static let personalRecomendations = StatsLocalization.localize("personal.recomendations")

    static let globalStatistics = StatsLocalization.localize("global.statistics")
    static let mostPopularDrinkSuffix = StatsLocalization.localize("most.popular.drink.suffix")
    static let averageCupsPerDay = StatsLocalization.localize("average.cups.per.day")

    static func masteredRecipes(value: UInt) -> String {
        let formatString: String = NSLocalizedString("mastered recipes", tableName: table, comment: "")
        let resultString: String = String.localizedStringWithFormat(formatString, value)
        return resultString
    }
 }
