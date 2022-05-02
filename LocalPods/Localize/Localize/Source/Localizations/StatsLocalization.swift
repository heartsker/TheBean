//
//  StatsLocalization.swift
//  Localize
//
//  Created by Daniel Pustotin on 27.03.2022.
//

/// Localization for Statistics
public class StatsLocalization: ILocalizable {
    public static let table: String = "Stats"

    public static let scoreLabel = StatsLocalization.localize(id: "score.label")
    public static let scoreCupsDrunk = StatsLocalization.localize(id: "score.cupsDrunk")
    public static let scoreRecipesMastered = StatsLocalization.localize(id: "score.recipesMastered")
    public static let scoreHealthScore = StatsLocalization.localize(id: "score.healthScore")

    public static let personalRecomendations = StatsLocalization.localize(id: "personal.recomendations")

    public static let globalStatistics = StatsLocalization.localize(id: "global.statistics")
    public static let mostPopularDrinkSuffix = StatsLocalization.localize(id: "most.popular.drink.suffix")
    public static let averageCupsPerDay = StatsLocalization.localize(id: "average.cups.per.day")

    public static func masteredRecipes(value: UInt) -> String {
        let formatString: String = NSLocalizedString("mastered recipes", tableName: table, comment: "")
        let resultString = String.localizedStringWithFormat(formatString, value)
        return resultString
    }
 }
