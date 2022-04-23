//
//  StatsLocalization.swift
//  Localize
//
//  Created by Daniel Pustotin on 27.03.2022.
//

import Foundation

public class StatsLocalization: ILocalizable {
    static let table: String = "Stats"

    public static let scoreLabel = StatsLocalization.localize("score.label")
    public static let scoreCupsDrunk = StatsLocalization.localize("score.cupsDrunk")
    public static let scoreRecipesMastered = StatsLocalization.localize("score.recipesMastered")
    public static let scoreHealthScore = StatsLocalization.localize("score.healthScore")

    public static let personalRecomendations = StatsLocalization.localize("personal.recomendations")

    public static let globalStatistics = StatsLocalization.localize("global.statistics")
    public static let mostPopularDrinkSuffix = StatsLocalization.localize("most.popular.drink.suffix")
    public static let averageCupsPerDay = StatsLocalization.localize("average.cups.per.day")

    public static func masteredRecipes(value: UInt) -> String {
        let formatString: String = NSLocalizedString("mastered recipes", tableName: table, comment: "")
        let resultString: String = String.localizedStringWithFormat(formatString, value)
        return resultString
    }
 }
